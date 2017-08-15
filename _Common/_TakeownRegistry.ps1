$definition = @"
    using System;
    using System.Runtime.InteropServices;
    namespace Win32Api
    {
        public class NtDll
        {
            [DllImport("ntdll.dll", EntryPoint="RtlAdjustPrivilege")]
            public static extern int RtlAdjustPrivilege(ulong Privilege, bool Enable, bool CurrentThread, ref bool Enabled);
        }
    }
"@
                     
if (-not ("Win32Api.NtDll" -as [type])) 
{
    Add-Type -TypeDefinition $definition -PassThru | out-null
}
else
{
    ("Win32Api.NtDll" -as [type]) | Out-Null
}

function TakeownRegistry($key) {

    # Enable SeTakeOwnershipPrivilege
    $bEnabled = $false
    $res = [Win32Api.NtDll]::RtlAdjustPrivilege(9, $true, $false, [ref]$bEnabled)

    $firstPart = $key.split('\')[0]
    $hive = $null
    $subkey = $null
    switch ($firstPart) {
        "HKEY_CLASSES_ROOT" {
            $hive = [Microsoft.Win32.Registry]::ClassesRoot
            $subkey = $key.substring($firstPart.length + 1)
        }
        "HKEY_CURRENT_USER" {
            $hive = [Microsoft.Win32.Registry]::CurrentUser
            $subkey = $key.substring($firstPart.length + 1)
        }
        "HKEY_LOCAL_MACHINE" {
            $hive = [Microsoft.Win32.Registry]::LocalMachine
            $subkey = $key.substring($firstPart.length + 1)
        }
    }

    # get administraor group
    $admins = New-Object System.Security.Principal.SecurityIdentifier("S-1-5-32-544")
    $admins = $admins.Translate([System.Security.Principal.NTAccount])

    # set owner
    $key = $hive.OpenSubKey($subkey, "ReadWriteSubTree", "TakeOwnership")
    $acl = $key.GetAccessControl()
    $acl.SetOwner($admins)
    $key.SetAccessControl($acl)

    # set FullControl
    $acl = $key.GetAccessControl()
    $rule = New-Object System.Security.AccessControl.RegistryAccessRule($admins, "FullControl", "Allow")
    $acl.SetAccessRule($rule)
    $key.SetAccessControl($acl)

}

