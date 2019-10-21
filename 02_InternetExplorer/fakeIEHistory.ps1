function GetRandomHost {
    $isValid = $false
    do {
        $domain = (RandomWord -Count 1)[0] + ".com"
        try {
            $ip = [System.Net.Dns]::GetHostEntry($domain)
            $isValid = $true
        }
        catch [System.Net.Sockets.SocketException] {
            if ($e.SocketErrorCode -ne [System.Net.Sockets.SocketError]::HostNotFound) {
                throw
            }
        }
    } until ($isValid)    
    return $domain
}


if (Test-Connection "internetbeacon.msedge.net" -Quiet) {
    $ie = New-Object -ComObject InternetExplorer.Application
    $ie.Visible = $true
    1..100 | % {        
        $hostname = GetRandomHost
        $ie.Navigate($hostname)
        Start-Sleep -Seconds 1
    }
    $ie.Quit()
}
else {
    if ( -not ([System.Management.Automation.PSTypeName]'Win32Api.Helper').Type) {
        Add-Type -TypeDefinition @"
        namespace Win32Api
        {
            using System;
            using System.Runtime.InteropServices;
            using System.Reflection;
            public struct STATURL
            {
                public static uint SIZEOF_STATURL =
                    (uint)Marshal.SizeOf(typeof(STATURL));
        
                public uint cbSize;
                [MarshalAs(UnmanagedType.LPWStr)]
                public string pwcsUrl;
                [MarshalAs(UnmanagedType.LPWStr)]
                public string pwcsTitle;
                public System.Runtime.InteropServices.ComTypes.FILETIME ftLastVisited,
                    ftLastUpdated,
                    ftExpires;
                public uint dwFlags;
            }
        
            [ComImport, Guid("3C374A42-BAE4-11CF-BF7D-00AA006946EE"),
                InterfaceType(ComInterfaceType.InterfaceIsIUnknown)]
            public interface IEnumSTATURL
            {
                [PreserveSig]
                uint Next(uint celt, out STATURL rgelt, out uint pceltFetched);
                void Skip(uint celt);
                void Reset();
                void Clone(out IEnumSTATURL ppenum);
                void SetFilter(
                    [MarshalAs(UnmanagedType.LPWStr)] string poszFilter,
                    uint dwFlags);
            }
        
            [ComImport, Guid("AFA0DC11-C313-11d0-831A-00C04FD5AE38"),
                InterfaceType(ComInterfaceType.InterfaceIsIUnknown)]
            public interface IUrlHistoryStg2
            {
                #region IUrlHistoryStg methods
                void AddUrl(
                    [MarshalAs(UnmanagedType.LPWStr)] string pocsUrl,
                    [MarshalAs(UnmanagedType.LPWStr)] string pocsTitle,
                    uint dwFlags);
        
                void DeleteUrl(
                    [MarshalAs(UnmanagedType.LPWStr)] string pocsUrl,
                    uint dwFlags);
        
                void QueryUrl(
                    [MarshalAs(UnmanagedType.LPWStr)] string pocsUrl,
                    uint dwFlags,
                    ref STATURL lpSTATURL);
        
                void BindToObject(
                    [MarshalAs(UnmanagedType.LPWStr)] string pocsUrl,
                    ref Guid riid,
                    [MarshalAs(UnmanagedType.IUnknown)] out object ppvOut);
        
                IEnumSTATURL EnumUrls();
                #endregion
        
                void AddUrlAndNotify(
                    [MarshalAs(UnmanagedType.LPWStr)] string pocsUrl,
                    [MarshalAs(UnmanagedType.LPWStr)] string pocsTitle,
                    uint dwFlags,
                    [MarshalAs(UnmanagedType.Bool)] bool fWriteHistory,
                    [MarshalAs(UnmanagedType.IUnknown)] object /*IOleCommandTarget*/
                    poctNotify,
                    [MarshalAs(UnmanagedType.IUnknown)] object punkISFolder);
        
                void ClearHistory();
            }
        
            [ComImport, Guid("3C374A40-BAE4-11CF-BF7D-00AA006946EE")]
            public class UrlHistory /* : IUrlHistoryStg[2] */ { }
        
        
            public static class Helper
            {
                private static IUrlHistoryStg2 history;
                static Helper()
                {
                    history = (IUrlHistoryStg2)(new UrlHistory());
                }
        
                public static void AddUrl(String url, String title)
                {
                    history.AddUrl(url, title, 0);
                }
        
        
            }
        }
"@
    }
    1..100 | ForEach-Object {        
        [Win32Api.Helper]::AddUrl("http://test.example.com", (RandomWord -Count 1)[0] + ".com")
    }
}
