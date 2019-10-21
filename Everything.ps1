## Created: 10/21/2019 15:47:33
$jobs = @{}
function ForceRegKey ($path) {
    if (!(Test-path $path)) {
        New-Item -Path $path -ItemType Directory -Force | Out-Null
    }
}

$topWords = @("abandon","abandoned","abbey","ability","able","aboard","about","above","abroad","abruptly","absence","absent","absolute","absolutely","absorption","absurd","abundant","academy","accept","accepted","access","accident","accidents","accompanied","accord","according","account","accounts","accuracy","accurate","achieve","achieved","achilles","acid","acquire","acquired","acquisition","acres","across","act","acted","action","actions","active","activities","activity","actor","acts","actual","actually","adam","adapted","add","added","addition","additional","address","adjacent","adjust","admiral","admission","admit","admitted","adopted","adriatic","advance","advantage","adventure","adventureland","adventures","advice","advisable","advise","aegean","aeroplane","afar","affair","affect","affected","afford","afraid","africa","african","after","afternoon","afterwards","again","against","age","aged","agent","agents","ages","ago","agree","agreed","agreement","agricultural","aha","ahead","aid","aim","air","airbag","airport","alarm","albert","ale","alfonso","alice","alive","all","alley","alliance","allow","allowed","almost","alone","along","alongside","aloud","already","also","alter","altered","although","altogether","alum","always","amateur","amber","ambition","ambitions","ambulance","amendment","america","american","among","amongst","amount","amsterdam","analogous","analysis","ancient","and","andre","andreas","angel","anger","angle","anglo","angrily","angry","angus","animal","animals","animated","ankle","anna","anne","announced","annual","another","answer","answered","answers","ant","antechamber","anthony","anti","antiquity","antoine","antwerp","anxious","anxiously","any","anybody","anyone","anything","anyway","anywhere","apart","apartment","apartments","apparatus","apparent","apparently","appeal","appear","appearance","appeared","appears","apple","applied","apply","appointed","appreciate","approach","appropriate","approx","approximately","april","arc","arcade","arch","archbishop","architect","architecture","arctic","are","area","areas","argued","argument","arguments","argyris","aristotle","arm","armchair","armed","arms","armstrong","army","around","arrange","arranged","arrangements","arrest","arrested","arrival","arrive","arrived","arrives","arrow","arsenal","art","arthur","article","articles","artificial","artillery","artist","artists","arts","ash","ashamed","asia","aside","ask","asked","asking","asks","asleep","aspect","aspects","assembled","assets","assistant","associated","assume","assumed","assured","astonishing","astronomy","ate","athenian","athens","atlantic","atmosphere","atom","atomic","atoms","attach","attached","attack","attacked","attempt","attempted","attention","attic","attitude","attracted","attraction","attractions","attractive","audience","august","aunt","aurora","author","authorities","authority","authorize","authorized","authors","automatic","automatically","aux","available","ave","avenue","average","avoid","awake","award","aware","awareness","away","awful","awkward","axle","babies","baby","back","backbone","background","backrest","backwards","bad","badly","bag","balance","balcony","bald","ball","ballet","ballroom","balls","baltic","band","bang","bank","banks","bar","barcelona","bare","barefoot","barely","bark","barnacles","barrel","barricade","bars","base","based","basin","basis","basket","bath","bathroom","battery","battle","battles","bay","beach","beam","bear","beard","bears","beast","beat","beaten","beating","beautiful","beauty","became","because","become","becomes","becoming","bed","bedroom","beds","bedside","bedspread","bee","been","beer","before","beforehand","beg","began","begin","beginning","begins","begun","behind","being","beings","belief","believe","believed","bell","belle","bells","belly","belong","belonged","belongs","below","belt","belts","ben","bench","bend","beneath","benefit","bent","bergen","bernard","berry","beside","besides","best","bet","betray","betrayed","better","between","beyond","bible","big","bigger","bike","bill","billion","bird","birds","birth","birthday","bishop","bit","bite","bits","black","blade","blades","blame","blanche","blank","blanket","blew","blind","blistering","block","blood","bloody","bloom","blore","blouse","blow","blowing","blown","blue","boar","board","boat","boats","bodies","body","boil","boiled","bois","bold","bolt","bomb","bombs","bone","bones","book","books","boot","boots","bordeaux","border","bore","born","borne","bosporus","both","bother","bottle","bottles","bottom","bought","boulevard","bound","boutique","bow","bowed","box","boy","boyfriend","boys","brain","brake","braking","branch","branches","brand","brandy","brass","brave","bread","break","breakfast","breaking","breast","breasts","breath","breathe","breathing","brent","brest","breton","bretons","brick","bridge","brie","brief","briefcase","bright","brilliant","bring","bringing","brings","bristol","britain","british","brittany","broad","broke","broken","bronze","brother","brotherhood","brothers","brought","brown","bruges","brun","brush","brute","bucket","buckle","buffalo","build","building","buildings","built","bulb","bullet","bunch","bundle","bunk","burden","burgundy","buried","burn","burned","burning","burst","bursts","bury","bus","bushes","business","businessmen","buster","busy","but","butler","butter","button","buy","buying","buzzing","bye","byzantium","cabbage","cabin","cabinet","cable","caccia","caesar","cafe","cage","cake","calais","calculus","california","call","called","calling","calls","calm","calmly","came","camera","camp","campaign","camps","can","canada","canadian","canal","candle","cannon","cannot","canteen","canyon","cap","capable","capacity","cape","capital","captain","capture","car","caravan","card","cardboard","cardiac","cardinal","cards","care","career","carefree","careful","carefully","cargo","caribbean","carpet","carriage","carried","carries","carry","carrying","cars","cart","cartographic","cartoon","case","cases","cast","castile","castle","cat","catalytic","catch","caterpillar","cathedral","catherine","catholic","cats","cattle","caught","cause","caused","causes","causing","caution","cave","ceiling","celebrate","cell","cellar","cellars","cells","celtic","cement","cent","center","central","centre","centres","centuries","century","ceremony","certain","certainly","certainty","cesium","chain","chains","chair","chairman","chairs","chalk","chamber","chambers","champ","champagne","champs","chance","chancel","chang","change","changed","changes","changing","channel","chap","chapel","chapter","character","characteristic","characteristics","characters","charge","charged","charles","charm","charming","chart","chateau","cheap","check","checked","cheek","cheeks","cheerful","cheese","cheshire","chess","chest","chestnut","chicago","chicken","chief","child","childhood","childish","children","chimney","chin","china","chinese","chocolate","choice","choose","chop","chorus","chose","chosen","christ","christian","christmas","christopher","church","churches","cigarette","cigarettes","cinema","circle","circuit","circular","circumstances","cite","cities","citizen","city","civil","civilization","claim","claimed","clapper","class","classical","claude","clause","clauses","claythorne","clean","cleaning","clear","cleared","clearly","clerk","clever","click","cliff","climate","climb","climbed","clock","clocks","close","closed","closely","closer","closing","cloth","clothes","clothing","cloud","club","clue","clung","clutch","coal","coarse","coast","coastal","coastline","coasts","coat","code","coffee","coffin","cognac","coins","cold","collar","colleague","colleagues","collect","collected","collection","collective","colonel","colorado","colour","coloured","colours","columbus","column","columns","comb","combined","combustion","come","comes","comfort","comfortable","comic","coming","command","comment","comments","commercial","commit","committed","committee","common","commonplace","communication","community","companies","company","compared","comparison","compartment","compass","competition","competitive","complete","completed","completely","complex","composed","composition","comrade","comrades","con","concealed","conceived","concentration","concept","concern","concerned","concerning","concerns","concertina","conclude","concluded","conclusion","concorde","concrete","condemned","condition","conditions","conduction","cone","confess","confessed","confession","confidence","conflict","conflicts","confrontation","confused","confusion","conjuring","connect","connected","connection","conqueror","conquest","conscience","conscious","consciousness","consecutive","consensus","consent","conservation","consider","considerable","consideration","considered","consisted","constance","constant","constantinople","constantly","construct","constructed","construction","consul","consulate","consult","consumption","contact","contain","contained","container","containing","contains","contemporary","content","context","continent","continental","continue","continued","continues","continuous","contract","contradictory","contrary","contrast","contribute","contributed","contribution","control","controlled","controls","conversation","converter","convey","convinced","cook","cool","coolant","cooling","cooperation","coordinates","copenhagen","copy","coral","cork","corner","corporation","correct","correspond","corresponded","corresponding","corridor","corridors","cosmology","cost","costas","costs","costume","cottage","cotton","couch","could","council","count","counter","counting","countries","country","countrymen","countryside","county","couple","coupling","courage","course","court","courtyard","cousin","cover","covered","covering","covers","cowboy","crab","crack","cradle","crash","crate","crazy","cream","create","created","creating","creature","creatures","credit","crew","crews","cricket","cried","crime","crimea","crimes","criminal","criminals","crimson","croquet","cross","crossed","crossing","crowd","crowded","crown","cruel","cruise","crumbs","crumpled","crushed","cry","crying","crystal","cultural","culture","cup","cups","curiosity","curious","curiously","curly","current","currents","curtain","curtains","cushion","customs","cut","cutting","cyanide","cycle","cyril","dad","daily","dairy","damage","dame","damn","damned","damp","dance","dancing","danger","dangerous","danish","daphne","daphnoula","dare","dared","dark","darkness","darling","data","date","dates","daughter","david","davis","dawn","day","daylight","days","dead","deal","dealer","dealing","dealt","dear","death","deaths","debate","decades","december","decent","decide","decided","decision","decisions","decisive","decorated","decoration","dedicated","deep","deeply","defeat","defence","defend","defined","definite","definitely","definition","degree","del","delay","deliberate","deliberately","delicate","delight","delighted","delightful","deliver","delivery","demand","demanded","demands","denfert","denmark","denounce","department","departure","depended","dependent","depending","depends","deposition","depot","depress","depth","depths","des","descent","describe","described","description","desert","deserted","design","designed","desire","desk","despair","desperate","despite","destiny","destroy","destroyed","destruction","detail","details","detect","detector","determine","determined","develop","developed","development","device","devices","devil","devon","devoted","diagonal","dial","dialogue","diamond","diary","dictatorship","dictionary","did","didier","die","died","dieppe","diesel","difference","differences","different","differently","difficult","difficulties","difficulty","diffusion","digging","dim","dimension","dimensional","dimensions","din","dina","dinah","dining","dinner","dioxide","direct","direction","directions","directly","director","dirt","dirty","disappear","disappeared","discipline","discover","discovered","discoveries","discovery","discretion","discuss","discussion","disease","diseased","dish","dishes","disney","disneyland","display","disposal","dispute","distance","distances","distant","distinction","distinguish","distribution","disturb","diverse","diversity","divided","division","divorce","dizzy","dockyard","doctor","doctrine","document","dodo","does","dog","doing","dollars","dome","dominate","domination","don","donald","done","door","doors","doorway","doppler","dormant","dormouse","dose","double","doublethink","doubt","doubtfully","down","downstairs","downstream","dozen","drag","dragged","dragon","drank","draw","drawer","drawing","drawn","dreadful","dream","dreams","dress","dressed","dressing","drew","dried","drink","drinking","drinks","drive","driven","driver","driving","drop","dropped","drops","drove","drowned","drug","drugs","drunk","dry","duchess","duck","due","duke","dull","dunkirk","during","dust","dutch","duty","dwarfs","dying","each","eagerly","ear","earlier","earliest","early","ears","earth","ease","easily","east","eastasia","eastern","easy","eat","eaten","eating","economic","economy","edge","edition","education","edward","edwin","effect","effects","efficiency","efficient","effort","efforts","egg","eggs","egypt","eichty","eiffel","eight","eighteen","eighteenth","eighty","einstein","either","elastic","elbow","elderly","electric","electrical","electrically","electricity","electronic","elegant","element","elements","eleni","eleven","eleventh","eliminate","else","elsewhere","embrace","emerge","emerged","emily","emission","emissions","emitted","emotion","emperor","empire","empty","enable","enabled","encountered","encouraged","end","ended","ending","endless","ends","enemies","enemy","energy","engage","engaged","engine","engineer","england","english","enjoy","enjoyed","enormous","enough","ensemble","ensure","enter","entered","entertainment","enthusiasm","entire","entirely","entitled","entrance","entrant","envelope","environment","environmental","episode","equal","equally","equipment","equipped","equivalent","era","eric","error","escape","escaped","especially","espionage","essential","est","establish","established","establishment","estimate","estuary","etc","eternal","ether","eugenia","eugenios","eurasia","eurasian","euro","europe","european","europeans","even","evening","evenings","event","events","ever","every","everybody","everyday","everyone","everything","everywhere","evidence","evident","evidently","evil","evocation","evoke","evolution","evolutionary","exact","exactly","examination","examine","examined","example","examples","excellent","except","exception","exceptional","exchange","exchanges","excited","excuse","executed","execution","executive","exercise","exhaust","exhibition","exile","exist","existed","existence","existing","exists","exit","exotic","expanding","expansion","expect","expected","expecting","expedition","expensive","experience","experienced","experiment","experiments","explain","explained","explains","explanation","exploitation","exploration","explosion","export","exports","express","expressed","expression","extend","extended","extension","extent","exterior","external","extra","extraordinary","extremely","eye","eyebrows","eyed","eyelids","eyes","face","faced","faces","facing","fact","factor","factory","facts","faded","fail","failed","failure","faint","faintly","fair","fairly","fairy","faith","faithful","fall","fallen","falling","falls","false","familial","familiar","families","family","famous","fan","fancy","fang","fantasia","fantastic","fantasy","fantasyland","far","farewell","farther","fashion","fashioned","fast","faster","fat","fate","father","fault","favour","favoured","fear","feature","features","february","fed","feeble","feel","feeling","feelings","feels","feet","fell","fellow","fellows","felt","female","ferland","festival","fetch","fever","few","fiancee","fiction","field","fields","fierce","fifteen","fifteenth","fifth","fifty","fig","fight","fighting","figure","figures","fill","filled","filler","film","films","filter","filthy","final","finally","financial","find","finding","finds","fine","finger","fingers","finish","finished","finite","fire","fired","fireplace","firm","first","fiscal","fish","fisherman","fishermen","fishing","fit","fitted","fitting","five","fix","fixed","flag","flags","flame","flanders","flap","flash","flat","fled","fleet","fleets","flemish","flesh","flew","flight","float","floating","floor","floral","florence","florentine","florida","flow","flower","flowers","fluid","flung","fly","flying","focus","fog","fold","folded","follow","followed","following","follows","folly","fond","fontainebleau","food","fool","foot","footman","footsteps","for","forbidden","force","forced","forces","forehead","foreign","foreigners","forest","forever","forget","forgetting","forgive","forgot","forgotten","form","formation","formed","former","forming","forms","forrestall","fort","forth","fortress","fortunately","fortune","forty","forward","fossil","fought","found","foundation","founded","fountain","four","fourteen","fourteenth","fourth","foxy","fraction","fragment","frame","framework","fran","france","francis","franco","franklin","fred","frederick","free","freedom","freeze","french","frequency","frequent","frequently","fresh","friend","friendly","friends","friendship","fright","frightened","frightening","fro","frog","from","front","frontier","frontierland","frozen","fruit","fuel","full","fully","fun","function","functions","fundamental","funeral","funny","fur","furious","furness","furniture","further","fury","fuse","future","gabriel","galaxies","galaxy","galerie","galileo","galleries","gallery","galleys","game","games","gang","gangster","gangsters","garden","gardens","gas","gases","gasoline","gass","gate","gates","gather","gathered","gaulle","gauls","gave","gazed","gazing","gear","general","generally","generating","generation","genetic","geneva","genevieve","genius","genoa","genoese","genre","gentleman","gentlemen","gently","genuine","geographical","geography","george","german","germanic","germans","germany","gesture","get","gets","getting","ghost","giant","gibraltar","gift","gigantic","gillies","gin","girl","girls","give","given","gives","giving","glad","glance","glanced","glass","glasses","glimpse","glorious","gloves","goal","god","goes","going","gold","golden","goldstein","golf","golly","gone","good","goodbye","goodness","goods","goofy","gorilla","got","gothic","government","gown","grab","grace","gracious","gradually","grain","gramophone","grand","grande","grandeur","grandfather","grandmother","granted","grape","grasp","grass","grave","gravely","gravitational","gravity","gray","great","greater","greatest","greatly","greece","greek","greeks","green","greet","grew","grey","grigorevich","grin","grinned","ground","grounds","group","groups","grow","growing","grown","growth","grunted","gryphon","guard","guards","guerrilla","guess","guest","guests","guide","guided","guilt","guilty","gulf","gun","gurbin","habit","habits","had","haddock","hair","haired","half","hall","halted","hamburg","hamilton","hammer","hand","handed","handkerchief","handle","hands","handsome","hang","hanging","hangs","hans","hanse","hanseatic","happen","happened","happening","happens","happiness","happy","harbour","hard","hardly","hare","harsh","has","hastily","hat","hate","hated","hatred","hats","hatter","have","having","havre","head","headquarters","heads","health","healthy","heap","hear","heard","hearing","heart","hearts","heat","heaven","heavens","heavily","heavy","hectares","hedge","hedgehog","heels","height","heir","held","helicopter","hell","hello","help","helped","helpless","helps","hem","hence","henri","henry","her","hercules","here","heretic","heritage","hero","heroes","herring","hers","herself","hesitate","hey","hic","hid","hidden","hide","hiding","high","higher","highest","highly","highway","hill","him","himself","his","historical","history","hit","hiv","hold","holder","holding","holds","hole","holes","holiday","holidays","holland","holy","home","honest","honey","honour","hood","hook","hope","hoped","hoping","horizon","horizons","horn","horrible","horror","horse","horseback","horses","hospital","host","hostile","hot","hotel","hotels","hour","hours","house","houses","housing","how","however","hsi","hubble","huge","hugo","hukow","human","humble","hunched","hundred","hundreds","hung","hungry","hunt","hunting","hurried","hurry","hurt","husband","hydro","hydrogen","hysteria","iberian","ice","iceland","idea","ideal","ideas","identify","identifying","identity","idiot","ignition","ignorant","ignored","iii","ile","ill","illegal","illich","illusion","illustrate","illustrated","image","images","imaginary","imagination","imagine","imagined","immediate","immediately","immense","immortal","immune","impact","impatient","impatiently","imperial","importance","important","impose","imposed","impossible","impression","impressive","improve","impulse","impulses","inc","incapable","inch","inclination","include","included","includes","including","increase","increased","increases","incredible","indeed","independence","independent","india","indian","indicate","indicated","indicator","indispensable","individual","industrial","industry","infinite","influence","influential","influenza","information","ingeborg","ingsoc","inhabitants","inheritance","initial","initiative","initiatives","injury","ink","inland","inner","innocent","innumerable","insert","inside","inspector","inspiration","inspired","installed","instance","instant","instantly","instead","instinct","institute","institution","instructions","instrument","insurance","integrity","intellectual","intelligence","intelligent","intended","intense","intent","intention","interest","interested","interesting","interests","interior","internal","international","interrupted","interval","intervals","intimacy","into","intolerable","introduce","introduced","invalides","invented","invention","invitation","invite","invited","involved","ions","ireland","irish","iron","irregular","irritably","isaac","island","islands","isle","isolated","issue","issues","italian","italians","italy","item","its","itself","jack","jacket","jacques","jail","jam","james","january","japan","japanese","jazz","jealous","jean","jelly","jens","jensen","joanna","job","jobs","john","johnson","join","joined","joke","jones","joseph","journey","joy","juan","judge","judged","jules","julia","july","jump","jumped","junction","june","jungle","junior","junta","jupiter","jury","just","justice","justify","karaboudjan","kasimis","katharine","katinaki","keen","keep","keeping","keeps","kept","key","keys","kick","kid","kidnapped","kill","killed","killing","kilometres","kilowatt","kind","kinds","king","kingdom","kings","kiss","kitchen","knee","knees","knew","knife","knock","knocked","know","knowing","knowledge","known","knows","kostis","kurvi","label","laboratory","labour","labyrinth","lace","lack","lad","ladies","lady","laid","lake","lamb","lamp","land","landing","lands","landscape","lane","language","languages","lap","large","largely","larger","largest","lars","larsen","laser","last","lasted","late","later","latest","latin","latter","laugh","laughed","laughing","laughs","laughter","laura","lavatory","law","lawrence","laws","lawyer","lay","layout","lead","leader","leaders","leading","leads","league","lean","leaning","learn","learned","least","leather","leave","leaves","leaving","led","left","leg","legal","legend","legendary","legends","legislative","legs","length","lenin","leonardo","les","leslie","less","lesson","lessons","let","letter","letters","lev","level","levels","lever","lewis","liberal","liberation","liberty","library","lid","lie","lies","lieutenant","life","lift","lifted","light","lighthouse","lighthouses","lightning","lights","like","liked","likely","likewise","lilac","limit","limited","limits","line","lined","lines","link","linked","lion","lip","lips","lisbon","list","listen","listening","lit","literally","literary","literature","little","live","lived","lively","lives","living","liza","load","loaded","loads","local","located","location","lock","locked","lombard","london","long","longer","look","looked","looking","looks","loop","loose","lord","lose","losing","loss","lost","lot","lots","lotus","loud","loudly","louis","louvre","love","loved","lovely","low","lower","loyalty","luck","luckily","lucky","lucy","lug","luggage","luke","luminous","lump","lunatic","lunch","luxury","lying","lyon","macarthur","machine","machines","mad","madam","madame","made","madeira","madeleine","madman","madness","magazine","magic","magnetic","magnificent","magnitude","maid","main","maine","mainland","maintain","maintained","maintenance","majesty","major","majority","make","makes","making","man","manage","managed","manner","manor","manual","many","map","maps","marble","marcello","march","mare","maria","marie","marine","mariner","mariners","maritime","mark","marked","market","markets","marks","maroon","marriage","married","mars","marseille","marsh","marshes","marston","martin","martinsen","mary","maser","mask","mass","masses","massive","master","masterpiece","masters","match","mate","material","materials","maths","matina","matter","matters","maurice","max","maximum","may","maybe","maze","meal","mean","meaning","means","meant","meantime","meanwhile","measure","measured","measurements","measures","meat","mechanical","mechanism","medals","medical","medici","medicine","medieval","mediterranean","mediterraneans","meet","meeting","meetings","melancholy","member","members","membrane","memories","memory","men","menhir","menhirs","mental","mention","mentioned","mer","merchandise","merchant","merchants","mercy","mere","merely","merry","mesa","mess","message","messages","messenger","met","metal","method","metres","metro","mexico","mice","michael","michail","michel","michelin","mickey","microwave","mid","middle","midnight","might","mild","miles","military","milk","milky","million","millions","mills","mind","minds","mine","minimum","minister","ministry","minor","minute","minutes","miracle","mirror","mirrors","miss","missed","missing","mission","mist","mistake","mitsuhirato","mixed","mixture","mock","model","models","modern","modest","moment","momentary","moments","monarchy","monday","mondays","money","monopoly","monster","monstrous","month","months","monument","monuments","mood","moon","moral","more","moreover","morning","morris","morrow","mortensen","moscow","most","mostly","mother","motion","motive","motives","motor","mount","mountain","mountains","mouse","moustache","mouth","mouthful","mouths","move","moved","movement","movements","moves","movie","moving","much","mud","mug","mum","mummy","murder","murdered","murderer","murmur","murmured","muscle","musee","museum","museums","mushroom","music","musical","muslim","must","mutations","muttered","mutual","myself","mysterious","mystery","myth","mythology","nadia","nains","naive","naked","name","named","names","nanking","nantes","nanticoke","naples","napoleon","narrow","nasty","nation","national","nations","native","natural","naturally","nature","nautical","naval","nave","navigation","navigators","navy","near","nearby","nearer","nearest","nearly","neat","nebulae","necessary","necessity","neck","need","needed","needle","needles","needs","neige","neighbourhood","neither","nero","nerve","nerves","nervous","nestor","net","neutral","never","nevertheless","new","newfoundland","news","newspaper","newspapers","newspeak","newton","next","nice","nickname","nigger","night","nightmare","nights","nikitas","nina","nine","nineteen","nineteenth","ninety","ninth","noble","nobody","nodded","node","noise","noisy","non","none","nonsense","noon","nor","nordic","normal","norman","normandy","north","northern","norway","norwegian","nose","nostalgia","not","notably","note","notebook","noted","notes","nothing","notice","noticeable","noticed","notion","notre","novel","november","now","nowadays","nowhere","nowlan","nuclear","nugget","number","numbers","numerous","nurse","nursery","oak","obelix","object","objective","objects","obliged","observation","observations","observatory","observe","observed","observers","obtain","obvious","obviously","occasion","occasionally","occupation","occupy","occur","occurred","occurring","ocean","oceania","oceanic","october","odd","off","offended","offensive","offer","offered","offering","offers","office","officer","officers","offices","official","officials","offshore","often","oil","okay","old","older","oliver","olsen","once","one","ones","oneself","only","ontario","onto","opel","open","opened","opening","opens","opera","operate","operated","operating","operation","operations","opinion","opium","opportunity","opposite","opposition","orange","orbit","orbits","orchestra","order","ordered","orders","ordinary","oregon","organ","organisation","organization","organized","orient","oriental","origin","original","originally","origins","orleans","orthodoxy","other","others","otherwise","ought","our","ouroun","ourselves","out","outer","output","outside","oval","over","overalls","overcoat","overseas","owe","owen","own","owned","owner","pace","pacific","pack","packet","page","pages","paid","pain","paint","painted","painter","painters","painting","paintings","pair","pairs","palace","palais","pale","palm","pan","pane","panel","panic","panoramic","panos","panther","pantry","pants","paper","papers","paperweight","parade","paradise","parallel","parcel","pardon","parents","paris","park","parks","parliament","parliamentary","parsons","part","partial","particles","particular","particularly","parties","partly","parts","party","pass","passage","passed","passenger","passengers","passes","passing","passion","passport","past","patch","path","paths","pathway","patient","patients","patrick","pattern","paul","pause","paused","pavement","pay","peace","peaceful","peculiar","pedal","pen","pencil","pendulum","peninsula","pension","people","peoples","per","perceive","perceived","percent","percentage","perfect","perfectly","perform","performance","performed","perfume","perhaps","period","periods","permanent","permissible","permission","permit","permitted","person","personal","personality","personnel","persons","perspective","persuade","peter","phantom","phase","phenomenon","philip","philippe","phone","photograph","photographs","phrase","physical","physics","piano","pick","picked","picking","picture","pictures","picturesque","piece","pieces","pierre","pig","pigeon","pile","pilgrimage","pillow","pilot","pin","pinch","pink","pinocchio","pint","pipe","piracy","pirate","pirates","pitch","pity","place","placed","places","plagiannakos","plain","plan","plane","planet","planets","planned","plans","plant","planted","plants","plaster","plastic","plate","plates","platform","play","played","playing","plays","plaza","pleasant","please","pleased","pleasure","plenty","plump","plus","plymouth","pocket","poem","poems","poet","poetry","point","pointed","points","poison","pole","police","policeman","policy","polish","political","politics","pollutants","pollution","pont","pooh","pool","poor","pope","poppy","popular","population","porcelain","port","porte","portion","portrait","ports","portugal","portuguese","position","positions","positive","possess","possessed","possession","possibilities","possibility","possible","possibly","post","poster","posters","pot","potatoes","potential","pour","poverty","power","powerful","powers","practical","practice","practices","prague","pratt","precious","precise","precisely","precision","predicted","predictions","prefer","preferred","preliminary","preparation","prepared","presence","present","presentation","presented","presently","presents","preserve","preserved","president","press","pressed","pressing","pressure","prestige","presume","pretend","pretty","prevent","previous","previously","price","pride","primacy","primarily","primary","primitive","prince","princess","principal","principle","principles","print","prison","prisoner","prisoners","private","privateering","privilege","probably","problem","problems","procedure","proceed","proceedings","process","processes","procession","produce","produced","producing","product","production","products","profession","professional","professor","profit","program","programme","progress","project","proles","promise","promised","promising","proof","propaganda","proper","properly","property","proportion","proposed","protect","protected","protection","protective","protein","protest","proud","proudly","prove","proved","proven","provide","provided","provides","proximity","public","publication","published","pull","pulled","pulling","pullover","pulls","pulse","pump","pure","purple","purpose","purposes","push","pushed","pushes","pushing","put","puts","putting","puzzled","quack","quality","quantum","quarter","quarters","quartz","quasispecies","quay","que","quebec","queen","queer","quest","question","questions","quick","quickly","quiet","quietly","quite","rabbit","race","radio","rage","rail","railroad","railway","rain","rainbow","raincoat","raise","raised","raising","ran","ranch","random","rang","range","ranging","rank","rapid","rapidly","rare","rat","rate","rates","rather","ratio","rats","razor","reach","reached","reaches","reaching","read","reading","ready","real","reality","realize","realized","really","realm","rear","reason","reasonable","reasons","rebellion","recall","receive","received","recent","recently","reception","recognise","recognize","recognized","record","records","red","reduce","reduced","reduction","refer","reference","referred","referring","reflect","reflected","reflection","reflector","refuge","refused","regard","regime","region","regions","regular","reign","relate","related","relating","relation","relations","relationship","relationships","relative","relativity","release","released","relief","relieved","religious","remain","remained","remains","remark","remarkable","remarked","remember","remembered","remembers","reminds","remote","remove","removed","rena","renaissance","repeat","repeated","replaced","replication","replied","reply","report","represent","representative","represented","representing","represents","republic","reputation","request","required","rer","rescue","research","reserve","reserved","residence","resistance","resonance","resort","resources","respect","respond","response","responsible","rest","restaurant","restaurants","resting","restoration","restored","restraint","rests","result","resulted","resulting","results","return","returned","revenge","reverse","review","revolt","revolution","revolutionary","revolver","rheims","rhodes","rhyme","rhythm","rich","richard","richmond","rid","ride","ridiculous","rifle","rigging","right","rights","rim","ring","rise","rises","rising","risk","risks","rival","river","rivers","road","roads","roar","robert","robinson","rochelle","rock","rocket","rocks","rocky","rodhia","rogers","role","roll","rolled","rolling","roman","romans","romantic","rome","roof","room","rooms","roosevelt","rope","rosa","rose","roses","rotten","rouen","rough","roughly","round","route","routes","routine","row","royal","rubber","rubbish","rubidium","rue","rule","rules","ruling","run","running","runs","rush","russia","russian","rutherford","sabotage","saccharine","sad","saddle","safe","safely","safety","said","sail","sailing","sailor","sailors","sails","saint","sake","sale","salle","salon","saloon","salt","saltworks","same","san","sand","sane","sang","sank","sat","satisfied","saturday","saturdays","saucepan","savage","save","saved","savvy","saw","saxon","say","saying","says","scale","scandinavian","scar","scared","scarf","scarlet","scene","scenes","scent","school","schoolgirls","science","scientific","scientist","score","scotland","scrap","scream","screaming","screen","screw","scrubbers","sculpture","sculptures","scurvy","sea","seamen","search","searched","seas","season","seat","seats","seaweed","second","seconds","secret","secretary","secretly","section","sectors","secure","security","sedan","see","seeing","seek","seem","seemed","seems","seen","sees","seine","seized","seldom","select","selection","self","sell","selling","send","sending","senior","sensation","sense","sensitive","sent","sentence","separate","separated","sept","september","sequence","sequences","sequoia","sergeant","series","serioja","serious","seriously","serpent","servant","serve","served","service","services","servo","session","sestertii","set","seton","setting","settle","settled","settlement","seven","seventeen","seventeenth","seventy","several","severe","seville","sex","sexual","shade","shadow","shake","shakespeare","shaking","shall","shame","shanghai","shape","shaped","share","shared","shares","sharing","sharp","sharply","she","sheer","sheet","shelf","shelter","shift","shining","shiny","ship","ships","shipwreck","shipyards","shirt","shock","shoe","shoes","shone","shook","shoot","shooting","shop","shopping","shops","shore","shores","short","shortly","shorts","shot","shots","should","shoulder","shoulders","shout","shouted","shouting","shouts","show","showed","showing","shown","shows","shrewd","shrugged","shut","shuttle","sicily","sick","side","sides","sigh","sighed","sight","sights","sign","signal","signals","signed","significance","significant","signs","silence","silent","silhouette","silk","sill","silly","silver","similar","similarly","simple","simply","simultaneously","sin","since","sing","singing","single","sinister","sink","sir","sister","sisters","sit","site","sites","sits","sitting","situation","six","sixteen","sixteenth","sixth","sixty","size","skin","skirt","skull","sky","slave","slavery","slavic","sleep","sleeping","sleepy","sleeve","slept","slid","slight","slightly","slip","slipped","slogan","slogans","slope","slow","slowly","small","smaller","smallest","smart","smell","smelt","smile","smiled","smiles","smiling","smith","smoke","smoking","smooth","snack","snakes","sniff","snow","snowy","soap","social","societies","society","socket","socks","soft","softly","soil","sold","soldier","soldiers","sole","solemn","solid","solidarity","solitude","solution","some","somebody","somehow","someone","something","sometimes","somewhat","somewhere","son","song","songs","soon","sooner","sophoula","sorry","sort","sorts","sought","soul","sound","sounded","sounds","soup","sour","source","sources","south","southampton","southern","souvenirs","sovereignty","soviet","space","spain","span","spanish","spare","speak","speaking","speaks","special","species","specific","specifically","specified","spectacle","spectacles","spectacular","speech","speed","speeds","spell","spend","spent","spies","spiral","spirit","spirits","spiritual","spit","spite","splendid","split","spoke","spoken","sponge","spoon","sports","spot","spots","sprang","spray","spread","spreading","spring","spy","squad","squadron","square","squeeze","squeezed","squeezes","stability","stable","stack","staff","stage","stages","staircase","stairs","stake","stalin","stall","stalls","stand","standard","standards","standing","stands","star","stared","staring","stars","start","started","starting","startled","starts","state","stated","statement","states","static","station","stations","statistical","statue","statues","status","stay","stayed","staying","stays","steady","steam","steel","steep","steering","stefanos","stella","step","steppe","stepped","steps","stern","stick","sticking","stiff","still","stirred","stock","stolen","stomach","stone","stones","stood","stool","stop","stopped","stopping","stops","store","stories","storm","story","stove","straight","straightened","strain","strait","straits","strand","strange","strategy","straw","stream","street","streets","strength","stretch","stretched","stretches","strike","striking","string","strip","stroke","stroll","strong","stronger","strongly","struck","structure","struggle","stuck","student","students","studied","studies","studio","study","studying","stuff","stupid","style","sub","subject","subjects","succeed","succeeded","success","successful","successive","such","sudden","suddenly","suffer","suffered","suffering","sufficient","sugar","suggest","suggested","suggestion","suicide","suit","suitable","suitcase","suite","suits","sully","sulphur","sum","summer","sun","sunday","sundays","sunk","super","superb","supple","supplied","supply","support","supported","suppose","supposed","supposing","sure","surely","surface","surgery","surgical","surprise","surprised","surprising","surrounded","surrounding","survival","survive","suspect","suspected","suspicion","suspicious","swallow","swallowed","swam","swan","swear","sweat","sweater","sweden","swedish","sweep","sweet","swift","swim","swimming","swine","swing","swiss","switch","switched","swivel","swollen","sworn","symbol","symbolic","syme","syringe","system","systems","table","tables","tachycardia","tail","take","taken","takes","taking","tale","talent","tales","talk","talked","talking","tall","tamara","tank","tap","tar","target","tasch","tashkent","task","taste","tat","taught","tax","taxi","taylor","tea","teach","teacher","team","tear","tears","tease","teau","technical","technique","techniques","technology","teeheehee","teeth","telegram","telephone","telescope","telescreen","telescreens","television","tell","telling","tells","temper","temperature","tempest","temple","temporary","ten","tendency","tennis","tension","tenth","term","terms","terrace","terrestrial","terrible","terribly","terrific","territory","terror","test","testimony","texts","than","thank","thanks","that","the","theatre","their","them","theme","themselves","then","theories","theory","therapy","there","thereby","therefore","therese","thereto","these","thesis","they","thick","thief","thin","thing","things","think","thinking","thinks","third","thirst","thirteen","thirteenth","thirty","this","thomas","thomson","those","though","thought","thoughtfully","thoughts","thousand","thousands","three","threw","throat","throne","through","throughout","throw","thrown","throws","thrust","thump","thunder","thundering","thursday","thus","ticket","tidal","tide","tie","tied","ties","tight","tightly","till","time","times","tin","tingley","tins","tintin","tiny","tip","tired","tissue","title","tobacco","tobin","today","toes","together","tokyo","told","tom","tomb","tomorrow","tone","tongue","tonight","tonnage","tonnes","tons","tony","too","took","tool","tools","tooth","top","tore","torn","toronto","tortoise","torture","tortured","total","touch","touched","touching","tough","tour","tours","toward","towards","towel","tower","towers","towing","town","towns","toys","trace","track","tracks","trade","trading","tradition","traditional","traffic","tragic","trail","train","training","trains","traitor","tram","tramp","transept","transfer","transferred","transformed","transit","translated","transmission","transport","trap","trapped","traps","travel","travelled","travellers","travelling","travels","tray","tread","treasure","treasury","treat","treated","treatment","tree","trees","trembling","tremendous","trial","triangle","tribunal","trick","tricks","tried","tries","trim","trip","trips","triumph","troop","trouble","trough","trousers","truck","true","truly","trumpet","trunk","trust","truth","try","trying","tube","tucked","tuesday","tuesdays","tuileries","tune","tunnel","turn","turned","turning","turns","turtle","twelfth","twelve","twentieth","twenty","twice","twin","twinkle","twist","twisted","two","type","types","typhoons","typical","tyre","tyres","ugly","ulcer","ultimate","ultimately","umbrella","unable","uncle","unconscious","under","underground","underneath","understand","understanding","understood","undertaken","undoubtedly","unfortunately","uniform","union","unique","unit","united","units","unity","universal","universe","university","unknown","unless","until","unusual","upon","upper","upright","upset","upside","upstairs","urban","use","used","useful","useless","using","usual","usually","uttered","vague","vaguely","vain","valencia","valid","valley","value","values","van","vanished","vapourized","variable","varied","variety","various","vast","vayia","vehicle","vehicles","velvet","venerable","venetian","venice","vera","verne","versailles","verse","version","very","vessel","vessels","via","vicarage","vice","victim","victims","victor","victorian","victory","video","view","vii","viii","viking","village","ville","vine","violence","violent","violently","viral","virgin","virtue","virus","viruses","visa","visible","vision","visit","visiting","visitor","visitors","vista","vital","vivid","voice","voices","voltage","volume","vote","vous","voyage","voyages","wagg","wagon","waist","wait","waited","waiter","waiting","wake","walk","walked","walking","walks","wall","wallet","walls","walt","walter","wander","wandering","wang","want","wanted","wants","war","wardrobe","warfare","wargrave","warm","warmth","warn","warning","wars","was","wash","washed","washing","waste","watch","watched","watches","watching","water","waters","wave","waves","waving","wax","way","ways","weak","wealth","weapon","wear","wearing","wears","weather","wedding","wednesday","week","weeks","weight","welcome","well","wells","wendy","went","were","west","western","wet","what","whatever","wheat","wheel","wheels","when","whenever","where","whereas","wherever","whether","which","whichever","while","whiskers","whisper","whispered","whispers","whistle","white","who","whoever","whole","whom","whose","why","wicked","wide","wife","wig","wild","will","william","wilson","win","wind","windblown","window","windows","winds","windshield","wine","wing","wings","winston","winter","wiped","wire","wisdom","wise","wish","wished","witch","with","within","without","witness","witnesses","woke","wolf","woman","women","won","wonder","wondered","wonderful","wondering","wonderland","wonders","wooah","wood","wooden","wool","word","words","wore","work","worked","workers","working","works","workshop","world","worn","worried","worry","worse","worship","worst","worth","worthy","would","wound","wounded","wow","wrapped","wreckage","wrist","write","writers","writing","written","wrong","wrote","xiv","xvi","yannis","yard","year","years","yell","yelled","yellow","yes","yesterday","yet","ying","york","you","young","younger","your","yours","yourself","youth","zealand","zero","zone","zoo")

function RandomWord($count, $seperator = "") {
    $ans = ""
    (1..$count | ForEach-Object { $topWords | Get-Random -Count 1}) -join $seperator
    return $ans
}
function Remove-ScheduledTask {
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(       
        [Parameter(Mandatory = $true )][String] $TaskName,       
        [Parameter(Mandatory = $true )][String] $TaskPath        
    )

    $Schedule = New-Object -ComObject 'Schedule.Service'

    try {
        $Schedule.Connect($env:COMPUTERNAME)
        $TaskFolder = $Schedule.GetFolder($TaskPath)
        if ($PSCmdlet.ShouldProcess($Path,'Deleting Task')) {
            $TaskFolder.DeleteTask($TaskName,0)
        }
    } catch {
        Write-Error $_.exception.message
    }
}
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



## Job: ChangePSExecutionPolicty, H:\dev.public\VM_Setup\00_Windows\ChangePSExecutionPolicty.ps1
$jobs.Add("\00_Windows\ChangePSExecutionPolicty.ps1", {
Set-ExecutionPolicy -ExecutionPolicy Bypass -Force 
})


## Job: DisableAutomaticProxyCache, H:\dev.public\VM_Setup\00_Windows\DisableAutomaticProxyCache.ps1
$jobs.Add("\00_Windows\DisableAutomaticProxyCache.ps1", {
#Disable Automatic Proxy Result Cache
$key = "HKCU:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings"
ForceRegKey($key)
Set-ItemProperty -Path  $key -Name EnableAutoproxyResultCache -Type DWORD -Value 0x0 -Force

})


## Job: DisableErrorReporting, H:\dev.public\VM_Setup\00_Windows\DisableErrorReporting.ps1
$jobs.Add("\00_Windows\DisableErrorReporting.ps1", {

# Disable Windows Error Reporting
ForceRegKey("HKLM:\Software\Policies\Microsoft\PCHealth\ErrorReporting")
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\PCHealth\ErrorReporting" -Name DoReport -Type DWORD -Value 0x0 -Force

ForceRegkey("HKLM:\Software\Microsoft\Windows\Windows Error Reporting")
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\Windows Error Reporting" -Name Disabled -Type DWORD -Value 0x1 -Force

ForceRegKey("HKLM:\Software\Microsoft\Windows NT\CurrentVersion\AeDebug")
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\AeDebug" -Name Auto -Type String -Value 1 -Force

})


## Job: DisableFirewall, H:\dev.public\VM_Setup\00_Windows\DisableFirewall.ps1
$jobs.Add("\00_Windows\DisableFirewall.ps1", {
# Disable Firewall
netsh advfirewall set AllProfiles state off

})


## Job: DisableFontLogging, H:\dev.public\VM_Setup\00_Windows\DisableFontLogging.ps1
$jobs.Add("\00_Windows\DisableFontLogging.ps1", {
$key = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\MitigationOptions'
ForceRegKey($key)
Set-ItemProperty -Path $key -Name 'MitigationOptions_FontBocking' -Value 2000000000000 -ea SilentlyContinue 
})


## Job: DisableIPv6, H:\dev.public\VM_Setup\00_Windows\DisableIPv6.ps1
$jobs.Add("\00_Windows\DisableIPv6.ps1", {
# Disable IPv6
ForceRegKey("HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters")
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters" -Name DisabledComponents -Value 0xff -Force

})


## Job: DisableLLMNR, H:\dev.public\VM_Setup\00_Windows\DisableLLMNR.ps1
$jobs.Add("\00_Windows\DisableLLMNR.ps1", {
#Disable LLMNR
$key = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient"
ForceRegKey($key)
Set-ItemProperty -Path $key -Name EnableMulticast -Type DWORD -Value 0x0 -Force

})


## Job: DisableNetBios, H:\dev.public\VM_Setup\00_Windows\DisableNetBios.ps1
$jobs.Add("\00_Windows\DisableNetBios.ps1", {

#Disable NetBios
Stop-Service -Name lmhosts -Force
Set-Service -Name lmhosts -StartupType Disabled
$key = "HKLM:\System\CurrentControlSet\Services\VxD\MSTCP"
ForceRegkey($key)
Set-ItemProperty -Path $key -Name EnableDNS -Type String -Value 0 -Force

})


## Job: DisableNetworkAwareness, H:\dev.public\VM_Setup\00_Windows\DisableNetworkAwareness.ps1
$jobs.Add("\00_Windows\DisableNetworkAwareness.ps1", {

# Disable Network Awareness
$key = "HKLM:\System\CurrentControlSet\Services\NlaSvc\Parameters\Internet"
ForceRegKey($key)
Set-ItemProperty -Path $key -Name EnableActiveProbing -Value 0x0 -Force


})


## Job: DisableSSDP, H:\dev.public\VM_Setup\00_Windows\DisableSSDP.ps1
$jobs.Add("\00_Windows\DisableSSDP.ps1", {
# Disable SSDP
Stop-Service -Name SSDPSRV -Force
Set-Service -Name SSDPSRV -StartupType Disabled

})


## Job: DisableSystemRestore, H:\dev.public\VM_Setup\00_Windows\DisableSystemRestore.ps1
$jobs.Add("\00_Windows\DisableSystemRestore.ps1", {
$key = "HKLM:\Software\Policies\Microsoft\Windows NT\SystemRestore"
ForceRegKey($key)
Set-ItemProperty -Path $key -Name 'DisableSR' -Value 1 -Force
})


## Job: DisableTeredo, H:\dev.public\VM_Setup\00_Windows\DisableTeredo.ps1
$jobs.Add("\00_Windows\DisableTeredo.ps1", {
#Disable Teredo
netsh interface teredo set state disabled

})


## Job: DisableTimeService, H:\dev.public\VM_Setup\00_Windows\DisableTimeService.ps1
$jobs.Add("\00_Windows\DisableTimeService.ps1", {

#Disable Time Service
ForceRegKey("HKLM:\System\CurrentControlSet\Services\W32Time\Parameters")
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Services\W32Time\Parameters" -Name Type -Type String -Value NoSync -Force


})


## Job: DisableWindowsDefender, H:\dev.public\VM_Setup\00_Windows\DisableWindowsDefender.ps1
$jobs.Add("\00_Windows\DisableWindowsDefender.ps1", {
# Disable Windows Defender
if (Test-Path "HKLM:\Software\Policies\Microsoft\Windows Defender") {
    Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows Defender" -Name "DisableAntiSpyware" -Type DWord -Value 1

    $tasks = @(
        "\Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance"
        "\Microsoft\Windows\Windows Defender\Windows Defender Cleanup"
        "\Microsoft\Windows\Windows Defender\Windows Defender Scheduled Scan"
        "\Microsoft\Windows\Windows Defender\Windows Defender Verification"
    )

    foreach ($task in $tasks) {
        $parts = $task.split('\')
        $name = $parts[-1]
        $path = $parts[0..($parts.length-2)] -join '\'
        Remove-ScheduledTask -TaskName "$name" -TaskPath "$path"
    }

    #"Disabling Windows Defender via Group Policies"
    ForceRegKey "HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows Defender"
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows Defender" -Name "DisableAntiSpyware" -Type DWord -Value 1
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows Defender" -Name "DisableRoutinelyTakingAction" -Type DWord -Value 1
    ForceRegKey "HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows Defender\Real-Time Protection"
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows Defender\Real-Time Protection" -Name "DisableRealtimeMonitoring" -Type DWord -Value 1

    #"Disabling Windows Defender Services"
    TakeownRegistry("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WinDefend")
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\WinDefend" "Start" 4
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\WinDefend" "AutorunsDisabled" 3
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\WdNisSvc" "Start" 4
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\WdNisSvc" "AutorunsDisabled" 3
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Sense" "Start" 4
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Sense" "AutorunsDisabled" 3

    #"Removing Windows Defender context menu item"
    Set-Item -Path "HKLM:\SOFTWARE\Classes\CLSID\{09A47860-11B0-4DA5-AFA5-26D86198A780}\InprocServer32" -Value ""

    #"Removing Windows Defender GUI / tray from autorun"
    Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" -Name "WindowsDefender" -ea 0
}
})


## Job: DisableWPAD, H:\dev.public\VM_Setup\00_Windows\DisableWPAD.ps1
$jobs.Add("\00_Windows\DisableWPAD.ps1", {
#Disable WPAD
ForceRegKey("HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Wpad")
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Wpad" -Name WpadOverride -Type DWORD -Value 0x1 -Force

})


## Job: EnableCommandLineLoggingOnProcessStart, H:\dev.public\VM_Setup\00_Windows\EnableCommandLineLoggingOnProcessStart.ps1
$jobs.Add("\00_Windows\EnableCommandLineLoggingOnProcessStart.ps1", {
$key = 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System\Audit'
#Create the key if missing 
ForceRegKey $key

#Enable the Policy
Set-ItemProperty -Path $key -Name 'ProcessCreationIncludeCmdLine_Enabled' -Value 1 -ea SilentlyContinue 
})


## Job: EnabledPSScriptLogging, H:\dev.public\VM_Setup\00_Windows\EnabledPSScriptLogging.ps1
$jobs.Add("\00_Windows\EnabledPSScriptLogging.ps1", {
## Script Block Logging
$key = "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging"
ForceRegkey($key)
Set-ItemProperty -Path $key -Name "EnableScriptBlockLogging" -Type DWORD -Value 0x1 -Force
Set-ItemProperty -Path $key -Name "EnableScriptBlockInvocationLogging" -Type DWORD -Value 0x1 -Force

## System-Wide Transcription
#$key = "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\Transcription"
#ForceRegKey($key)
#Set-ItemProperty -Path $key -Name "EnableTranscripting" -Type DWORD -Value 0x1 -Force
#Set-ItemProperty -Path $key -Name "IncludeInvocationHeader" -Type DWORD -Value 0x1 -Force
#Set-ItemProperty -Path $key -Name "OutputDirectory" -Type String -Value "C:\ScriptLogs" -Force

})


## Job: misc, H:\dev.public\VM_Setup\00_Windows\misc.ps1
$jobs.Add("\00_Windows\misc.ps1", {

function Set-ItemPropertyEx {
    param(
        $Path,
        $Name,
        $Type,
        $Value,
        [Switch] $Force
    )    

    ForceRegKey($Path)
    Set-ItemProperty -Path $Path -Name $Name -Type $Type -Value $Value -Force
}


#Disable Several Windows options for Internet access via Policy
Set-ItemPropertyEx -Path "HKLM:\Software\Policies\Microsoft\SQMClient\Windows" -Name CEIPEnable -Type DWORD -Value 0x0 -Force
Set-ItemPropertyEx -Path "HKLM:\Software\Policies\Microsoft\Windows\NetworkConnectivityStatusIndicator" -Name NoActiveProbe -Type DWORD -Value 0x1 -Force
Set-ItemPropertyEx -Path "HKLM:\Software\Policies\Microsoft\Windows\DriverSearching" -Name DontSearchWindowsUpdate -Type DWORD -Value 0x1 -Force
Set-ItemPropertyEx -Path "HKLM:\Software\Policies\Microsoft\SearchCompanion" -Name DisableContentFileUpdates -Type DWORD -Value 0x1 -Force
Set-ItemPropertyEx -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name NoInternetOpenWith -Type DWORD -Value 0x1 -Force
Set-ItemPropertyEx -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name NoWebServices -Type DWORD -Value 0x1 -Force
Set-ItemPropertyEx -Path "HKLM:\Software\Policies\Microsoft\Windows\TabletPC" -Name PreventHandwritingDataSharing -Type DWORD -Value 0x1 -Force
Set-ItemPropertyEx -Path "HKLM:\Software\Policies\Microsoft\Messenger\Client" -Name CEIP -Type DWORD -Value 0x0 -Force
Set-ItemPropertyEx -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name NoPublishingWizard -Type DWORD -Value 0x1 -Force
Set-ItemPropertyEx -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name NoOnlinePrintsWizard -Type DWORD -Value 0x1 -Force
Set-ItemPropertyEx -Path "HKLM:\Software\Policies\Microsoft\Windows\Registration Wizard Control" -Name NoRegistration -Type DWORD -Value 0x1 -Force
Set-ItemPropertyEx -Path "HKLM:\Software\Policies\Microsoft\Windows\Internet Connection Wizard" -Name ExitOnMSICW -Type DWORD -Value 0x1 -Force
Set-ItemPropertyEx -Path "HKLM:\Software\Policies\Microsoft\PCHealth\HelpSvc" -Name MicrosoftKBSearch -Type DWORD -Value 0x0 -Force
Set-ItemPropertyEx -Path "HKLM:\Software\Policies\Microsoft\PCHealth\HelpSvc" -Name Headlines -Type DWORD -Value 0x0 -Force
Set-ItemPropertyEx -Path "HKLM:\Software\Policies\Microsoft\Windows\HandwritingErrorReports" -Name PreventHandwritingErrorReports -Type DWORD -Value 0x1 -Force
Set-ItemPropertyEx -Path "HKLM:\Software\Policies\Microsoft\Windows NT\Printers" -Name DisableHTTPPrinting -Type DWORD -Value 0x1 -Force
Set-ItemPropertyEx -Path "HKLM:\Software\Policies\Microsoft\Windows NT\Printers" -Name DisableWebPnPDownload -Type DWORD -Value 0x1 -Force
Set-ItemPropertyEx -Path "HKLM:\Software\Policies\Microsoft\EventViewer" -Name MicrosoftEventVwrDisableLinks -Type DWORD -Value 0x1 -Force
Set-ItemPropertyEx -Path "HKLM:\Software\Policies\Microsoft\SystemCertificates\AuthRoot" -Name DisableRootAutoUpdate DWORD -Value 0x1 -Force


})


## Job: DisableJavaUpdateScheduler, H:\dev.public\VM_Setup\01_Java\DisableJavaUpdateScheduler.ps1
$jobs.Add("\01_Java\DisableJavaUpdateScheduler.ps1", {
Remove-ItemProperty -Path "HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Run" -Name "SunJavaUpdateSched" -Force -ErrorAction SilentlyContinue
Remove-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Run" -Name "SunJavaUpdateSched" -Force -ErrorAction SilentlyContinue

$jusched="C:\Program Files\Common Files\Java\Java Update\jusched.exe"

if (Test-Path $jusched) {
	Rename-Item -Path $jusched -NewName ($jusched + ".bak")
}

$jusched="C:\Program Files (86)\Common Files\Java\Java Update\jusched.exe"
if (Test-Path $jusched) {
	Rename-Item -Path $jusched -NewName ($jusched + ".bak")
}




})


## Job: DisableActiveXFiltering, H:\dev.public\VM_Setup\02_InternetExplorer\DisableActiveXFiltering.ps1
$jobs.Add("\02_InternetExplorer\DisableActiveXFiltering.ps1", {
#Create the key if missing 
$key = 'HKLM:\Software\Policies\Microsoft\Internet Explorer\Safety\ActiveXFiltering'
ForceRegkey($key)
#Disable the Policy 
Set-ItemProperty -Path $key -Name 'IsEnabled' -Value 0 -Force

})


## Job: DisableAutoCrashRecovery, H:\dev.public\VM_Setup\02_InternetExplorer\DisableAutoCrashRecovery.ps1
$jobs.Add("\02_InternetExplorer\DisableAutoCrashRecovery.ps1", {
#Create the key if missing 
$key = 'HKLM:\Software\Policies\Microsoft\Internet Explorer\Recovery'
ForceRegkey($key)

#Enable the Policy
Set-ItemProperty -Path $key -Name 'AutoRecover' -Value 2 -ea SilentlyContinue 
})


## Job: DisableBrowserGeolocation, H:\dev.public\VM_Setup\02_InternetExplorer\DisableBrowserGeolocation.ps1
$jobs.Add("\02_InternetExplorer\DisableBrowserGeolocation.ps1", {
#Create the key if missing 
$key = 'HKLM:\Software\Policies\Microsoft\Internet Explorer\Geolocation'
ForceRegKey($key)
#Enable the Policy
Set-ItemProperty -Path $key -Name 'PolicyDisableGeolocation' -Value 1 -Force
})


## Job: DisablePerfCheck, H:\dev.public\VM_Setup\02_InternetExplorer\DisablePerfCheck.ps1
$jobs.Add("\02_InternetExplorer\DisablePerfCheck.ps1", {
#Create the key if missing 
$key = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Ext"
ForceRegKey($key)
#Enable the Policy
Set-ItemProperty -Path $key -Name 'DisableAddonLoadTimePerformanceNotifications' -Value 1 -Force
})


## Job: DisableSecuritySettingsCheck, H:\dev.public\VM_Setup\02_InternetExplorer\DisableSecuritySettingsCheck.ps1
$jobs.Add("\02_InternetExplorer\DisableSecuritySettingsCheck.ps1", {
#Create the key if missing 
$key = "HKLM:\Software\Policies\Microsoft\Internet Explorer\Security"
ForceRegKey($key)
#Enable the Policy
Set-ItemProperty -Path $key -Name 'DisableSecuritySettingsCheck' -Value 1 -Force
})


## Job: DisableSmartScreen, H:\dev.public\VM_Setup\02_InternetExplorer\DisableSmartScreen.ps1
$jobs.Add("\02_InternetExplorer\DisableSmartScreen.ps1", {
#Create the key if missing 
$key = "HKLM:\Software\Policies\Microsoft\Internet Explorer\PhishingFilter"
ForceRegKey($key)

#Settings 
Set-ItemProperty -Path $key -Name 'EnabledV8' -Value 0 -Force
})


## Job: DisableSuggestedSites, H:\dev.public\VM_Setup\02_InternetExplorer\DisableSuggestedSites.ps1
$jobs.Add("\02_InternetExplorer\DisableSuggestedSites.ps1", {
#Create the key if missing 
$key = "HKLM:\Software\Policies\Microsoft\Internet Explorer\Suggested Sites"
ForceRegKey($key)

#Disable the Policy 
Set-ItemProperty -Path $key -Name 'Enabled' -Value 0 -Force
})


## Job: DisableUpdateCheck, H:\dev.public\VM_Setup\02_InternetExplorer\DisableUpdateCheck.ps1
$jobs.Add("\02_InternetExplorer\DisableUpdateCheck.ps1", {
#Create the key if missing 
$key = "HKLM:\Software\Policies\Microsoft\Internet Explorer\Infodelivery\Restrictions"
ForceRegKey($key)
#Enable the Policy
Set-ItemProperty -Path $key -Name 'NoUpdateCheck' -Value 1 -Force


#Create the key if missing 
$key = "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main"
ForceRegKey($key)
#Disable the Policy 
Set-ItemProperty -Path $key -Name 'EnableAutoUpgrade' -Value 0 -ea SilentlyContinue 

})


## Job: EnableActiveX, H:\dev.public\VM_Setup\02_InternetExplorer\EnableActiveX.ps1
$jobs.Add("\02_InternetExplorer\EnableActiveX.ps1", {
#Create the key if missing 
$key = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Ext"
ForceRegkey($key)
#Enable the Policy
Set-ItemProperty -Path $key -Name 'NoFirsttimeprompt' -Value 1 -ea SilentlyContinue 

})


## Job: EnablePopUps, H:\dev.public\VM_Setup\02_InternetExplorer\EnablePopUps.ps1
$jobs.Add("\02_InternetExplorer\EnablePopUps.ps1", {
#Create the key if missing 
$key ="HKLM:\Software\Policies\Microsoft\Internet Explorer\Restrictions"
ForceRegkey($key)

#Enable the Policy
Set-ItemProperty -Path $key -Name 'NoPopupManagement' -Value 1 -ea SilentlyContinue 

})


## Job: fakeIEHistory, H:\dev.public\VM_Setup\02_InternetExplorer\fakeIEHistory.ps1
$jobs.Add("\02_InternetExplorer\fakeIEHistory.ps1", {
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

})


## Job: SetNewTabPage, H:\dev.public\VM_Setup\02_InternetExplorer\SetNewTabPage.ps1
$jobs.Add("\02_InternetExplorer\SetNewTabPage.ps1", {
#Create the key if missing 
$key = "HKLM:\Software\Policies\Microsoft\Internet Explorer\TabbedBrowsing"
ForceRegKey($key)

#Settings 
Set-ItemProperty -Path $key -Name 'NewTabPageShow' -Value 0 -ea SilentlyContinue 
})

$AdobeReaderBaseKey = 'HKCU:\Software\Adobe\Acrobat Reader\2017\AdobeViewer'

#Create the key if missing 
ForceRegKey($AdobeReaderBaseKey)

$AdobeReaderPolicyFLKey = 'HKLM:\SOFTWARE\Policies\Adobe\Acrobat Reader\2017\FeatureLockdown'

#Create the key if missing 
ForceRegKey($AdobeReaderPolicyFLKey)


## Job: AcceptEULA, H:\dev.public\VM_Setup\03_Acrobat\AcceptEULA.ps1
$jobs.Add("\03_Acrobat\AcceptEULA.ps1", {

#Enable the Policy
Set-ItemProperty -Path $AdobeReaderBaseKey -Name 'EULA' -Value 1 -ea SilentlyContinue 

})


## Job: DisableAutomaticUpdates, H:\dev.public\VM_Setup\03_Acrobat\DisableAutomaticUpdates.ps1
$jobs.Add("\03_Acrobat\DisableAutomaticUpdates.ps1", {

#Enable the Policy
Set-ItemProperty -Path $AdobeReaderPolicyFLKey -Name 'bUpdater' -Value 1 -Force
})


## Job: DisableFeedback, H:\dev.public\VM_Setup\03_Acrobat\DisableFeedback.ps1
$jobs.Add("\03_Acrobat\DisableFeedback.ps1", {

#Disable the Policy 
Set-ItemProperty -Path $AdobeReaderPolicyFLKey -Name 'bUsageMeasurement' -Value 0 -Force
})


## Job: DisableInDocMessages, H:\dev.public\VM_Setup\03_Acrobat\DisableInDocMessages.ps1
$jobs.Add("\03_Acrobat\DisableInDocMessages.ps1", {
$key = $AdobeReaderPolicyFLKey + "\cIPM"
#Create the key if missing 
ForceRegKey($key)

#Disable the Policy 
Set-ItemProperty -Path $key -Name 'bDontShowMsgWhenViewingDoc' -Value 0 -Force 
})


## Job: DisableProtectedMode, H:\dev.public\VM_Setup\03_Acrobat\DisableProtectedMode.ps1
$jobs.Add("\03_Acrobat\DisableProtectedMode.ps1", {

#Disable the Policy 
Set-ItemProperty -Path $AdobeReaderPolicyFLKey -Name 'bProtectedMode' -Value 0 -Force 

})


## Job: DisableSpashScreen, H:\dev.public\VM_Setup\03_Acrobat\DisableSpashScreen.ps1
$jobs.Add("\03_Acrobat\DisableSpashScreen.ps1", {

#Disable the Policy 
Set-ItemProperty -Path $AdobeReaderPolicyFLKey -Name 'bDisplayAboutDialog' -Value 0 -ea SilentlyContinue 

})


## Job: DisableStartUpMessages, H:\dev.public\VM_Setup\03_Acrobat\DisableStartUpMessages.ps1
$jobs.Add("\03_Acrobat\DisableStartUpMessages.ps1", {
$key = $AdobeReaderPolicyFLKey + "\cIPM"
#Create the key if missing 
ForceRegKey($key)

#Disable the Policy 
Set-ItemProperty -Path $key -Name 'bShowMsgAtLaunch' -Value 0 -Force 
})


## Job: EnableJS, H:\dev.public\VM_Setup\03_Acrobat\EnableJS.ps1
$jobs.Add("\03_Acrobat\EnableJS.ps1", {
$key = 'HKCU:\Software\Adobe\Acrobat Reader\2017\JSPrefs'
#Create the key if missing 
ForceRegKey($key)

#Enable the Policy
Set-ItemProperty -Path $key -Name 'bEnableJS' -Value 1 -ea SilentlyContinue 

})


## Job: TrustWindowsZones, H:\dev.public\VM_Setup\03_Acrobat\TrustWindowsZones.ps1
$jobs.Add("\03_Acrobat\TrustWindowsZones.ps1", {

$key = 'HKCU:\Software\Adobe\Acrobat Reader\2017\TrustManager' 
#Create the key if missing 
ForceRegKey($key)

#Enable the Policy
Set-ItemProperty -Path $key -Name 'bTrustOSTrustedSites' -Value 1 -ea SilentlyContinue 

})

$chromePolicyKey = 'HKLM:\Software\Policies\Google\Chrome'

#Create the key if missing 
ForceRegKey($chromePolicyKey)


## Job: DisableBuiltinDNS, H:\dev.public\VM_Setup\03_Chrome\DisableBuiltinDNS.ps1
$jobs.Add("\03_Chrome\DisableBuiltinDNS.ps1", {

#Disable the Policy 
Set-ItemProperty -Path $chromePolicyKey -Name 'BuiltInDnsClientEnabled' -Value 0 -Force 
})


## Job: DisableSafeBrowsing, H:\dev.public\VM_Setup\03_Chrome\DisableSafeBrowsing.ps1
$jobs.Add("\03_Chrome\DisableSafeBrowsing.ps1", {

#Disable the Policy 
Set-ItemProperty -Path $chromePolicyKey -Name 'SafeBrowsingEnabled' -Value 0 -Force 
})


## Job: DisableSafeSearch, H:\dev.public\VM_Setup\03_Chrome\DisableSafeSearch.ps1
$jobs.Add("\03_Chrome\DisableSafeSearch.ps1", {

#Disable the Policy 
Set-ItemProperty -Path $chromePolicyKey -Name 'ForceGoogleSafeSearch' -Value 0 -Force 

})


## Job: DisableUpdates, H:\dev.public\VM_Setup\03_Chrome\DisableUpdates.ps1
$jobs.Add("\03_Chrome\DisableUpdates.ps1", {
$chromeUpdateKey = 'HKLM:\Software\Policies\Google\Update'
$chromeUpdateKeyWOW = 'HKLM:\Software\Wow6432Node\Policies\Google\Update'

#Create the key if missing 
ForceRegKey($chromeUpdateKey)
ForceRegKey($chromeUpdateKeyWOW)

#Settings 
Set-ItemProperty -Path $chromeUpdateKey -Name 'UpdateDefault' -Value 0 -Force
Set-ItemProperty -Path $chromeUpdateKey -Name 'AutoUpdateCheckPeriodMinutes' -Value 0 -Force
Set-ItemProperty -Path $chromeUpdateKey -Name 'DisableAutoUpdateChecksCheckboxValue' -Value 1 -Force
Set-ItemProperty -Path $chromeUpdateKey -Name 'Update{8A69D345-D564-463C-AFF1-A69D9E530F96}' -Value 0 -Force

#Settings WOW6432
Set-ItemProperty -Path $chromeUpdateKeyWOW -Name 'UpdateDefault' -Value 0 -Force
Set-ItemProperty -Path $chromeUpdateKeyWOW -Name 'AutoUpdateCheckPeriodMinutes' -Value 0 -Force
Set-ItemProperty -Path $chromeUpdateKeyWOW -Name 'DisableAutoUpdateChecksCheckboxValue' -Value 1 -Force
Set-ItemProperty -Path $chromeUpdateKeyWOW -Name 'Update{8A69D345-D564-463C-AFF1-A69D9E530F96}' -Value 0 -Force

#Stop Google Update Services
Stop-Service -Name gupdate -Force
Stop-Service -Name gupdatem -Force

#Disable Google Update Services
Set-Service -Name gupdate -StartupType Disabled
Set-Service -Name gupdatem -StartupType Disabled

#Delete the update folder
$folder = "C:\Program Files (x86)\Google\Update\"
if (Test-Path $folder) { Remove-Item -Path $folder -Force | Out-Null }
$folder = "C:\Program Files\Google\Update\"
if (Test-Path $folder) { Remove-Item -Path $folder -Force | Out-Null }


})

$FireFoxBasePolicyRegKey = 'HKLM:\Software\Policies\Mozilla\Firefox'

ForceRegKey($FireFoxBasePolicyRegKey)


## Job: DisableAddOnWizard, H:\dev.public\VM_Setup\03_Firefox\DisableAddOnWizard.ps1
$jobs.Add("\03_Firefox\DisableAddOnWizard.ps1", {

#Enable the Policy
Set-ItemProperty -Path $FireFoxBasePolicyRegKey-Name 'DisableAddonWizard' -Value 1 -ea SilentlyContinue 
})


## Job: DisableAutomaticUpdates, H:\dev.public\VM_Setup\03_Firefox\DisableAutomaticUpdates.ps1
$jobs.Add("\03_Firefox\DisableAutomaticUpdates.ps1", {

#Settings 
Set-ItemProperty -Path $FireFoxBasePolicyRegKey -Name 'DisableUpdate' -Value 1 -ea SilentlyContinue 
Set-ItemProperty -Path $FireFoxBasePolicyRegKey -Name 'DisableExtensionsUpdate' -Value 1 -ea SilentlyContinue 
Set-ItemProperty -Path $FireFoxBasePolicyRegKey -Name 'DisableSearchUpdate' -Value 1 -ea SilentlyContinue 

})


## Job: DisableDefaultBrowserCheck, H:\dev.public\VM_Setup\03_Firefox\DisableDefaultBrowserCheck.ps1
$jobs.Add("\03_Firefox\DisableDefaultBrowserCheck.ps1", {

#Enable the Policy
Set-ItemProperty -Path $FireFoxBasePolicyRegKey -Name 'DisableDefaultCheck' -Value 1 -ea SilentlyContinue 

})


## Job: DisableKnowYourRights, H:\dev.public\VM_Setup\03_Firefox\DisableKnowYourRights.ps1
$jobs.Add("\03_Firefox\DisableKnowYourRights.ps1", {

#Enable the Policy
Set-ItemProperty -Path $FireFoxBasePolicyRegKey -Name 'DisableRights' -Value 1 -ea SilentlyContinue 

})


## Job: DisableTelemetry, H:\dev.public\VM_Setup\03_Firefox\DisableTelemetry.ps1
$jobs.Add("\03_Firefox\DisableTelemetry.ps1", {

#Enable the Policy
Set-ItemProperty -Path $FireFoxBasePolicyRegKey -Name 'DisableTelemetry' -Value 1 -ea SilentlyContinue 

})


## Job: DisableWhatsNew, H:\dev.public\VM_Setup\03_Firefox\DisableWhatsNew.ps1
$jobs.Add("\03_Firefox\DisableWhatsNew.ps1", {

#Enable the Policy
Set-ItemProperty -Path $FireFoxBasePolicyRegKey -Name 'SupressUpdatePage' -Value 1 -ea SilentlyContinue 

})

$OfficeVersions = Get-ChildItem -Path "HKCU:\Software\Microsoft\Office\" | Where-Object {$_.Name.Contains('.0')} | ForEach-Object { $_.PSChildName }



## Job: DisableAppSecurity, H:\dev.public\VM_Setup\03_Office\DisableAppSecurity.ps1
$jobs.Add("\03_Office\DisableAppSecurity.ps1", {
$OfficeVersions | ForEach-Object {
    $key = "HKCU:\Software\Microsoft\Office\" + $_ + "\Common\Security"
    ForceRegKey($key)
    Set-ItemProperty -Path $key -Name "Disable" -Type DWORD -Value 0x1 -Force
}



})


## Job: DisableDEP, H:\dev.public\VM_Setup\03_Office\DisableDEP.ps1
$jobs.Add("\03_Office\DisableDEP.ps1", {

@("Word", "Excel", "PowerPoint") | ForEach-Object {
    $app = $_
    $OfficeVersions | ForEach-Object {
        $version = $_
        $key = "HKCU:\Software\Microsoft\Office\" + $version + "\" + $app + "\Security"
        ForceRegKey($key)
        Set-ItemProperty -Path $key -Name "EnableDEP" -Type DWORD -Value 0x0 -Force
    }
}


})


## Job: DisableDRMPropertyEncryption, H:\dev.public\VM_Setup\03_Office\DisableDRMPropertyEncryption.ps1
$jobs.Add("\03_Office\DisableDRMPropertyEncryption.ps1", {
$OfficeVersions | ForEach-Object {
    $key = "HKCU:\Software\Microsoft\Office\" + $_ + "\Common\Security"
    ForceRegKey($key)
    Set-ItemProperty -Path $key -Name "DRMEncryptProperty" -Type DWORD -Value 0x0 -Force
}

})


## Job: DisableFileBlock, H:\dev.public\VM_Setup\03_Office\DisableFileBlock.ps1
$jobs.Add("\03_Office\DisableFileBlock.ps1", {
@("Word", "Excel", "PowerPoint") | ForEach-Object {
    $app = $_
    $OfficeVersions | ForEach-Object {
        $version = $_
        
        ## Disable File Blocking by Version
        $key = "HKCU:\Software\Microsoft\Office\" + $version + "\" + $app + "\Security"        
        ForceRegKey($key)
        Set-ItemProperty -Path $key -Name "FilesBeforeVersion" -Type DWORD -Value 0x0 -Force


        ## Disable File Blocking by Type

        if ($app -eq "PowerPoint") { 
            $key = "HKCU:\Software\Microsoft\Office\" + $version + "\" + $app + "\Security\FileOpenBlock" 
        } else {
            #This isn't always correct (some versions of Office name it differently)
            $key = "HKCU:\Software\Microsoft\Office\" + $version + "\" + $app + "\Security\FileBlock"
        }
        ForceRegKey($key)
        switch ($app) {
            "Word" {
                Set-ItemProperty -Path $key -Name "Word95Files" -Type DWORD -Value 0x0 -Force
                Set-ItemProperty -Path $key -Name "Word60Files" -Type DWORD -Value 0x0 -Force
                Set-ItemProperty -Path $key -Name "Word2Files" -Type DWORD -Value 0x0 -Force                
            }
            "Excel" {
                Set-ItemProperty -Path $key -Name "XL4Workbooks" -Type DWORD -Value 0x0 -Force
                Set-ItemProperty -Path $key -Name "XL4Worksheets" -Type DWORD -Value 0x0 -Force
                Set-ItemProperty -Path $key -Name "XL3Worksheets" -Type DWORD -Value 0x0 -Force
                Set-ItemProperty -Path $key -Name "XL2Worksheets" -Type DWORD -Value 0x0 -Force
                Set-ItemProperty -Path $key -Name "XL4Macros" -Type DWORD -Value 0x0 -Force
                Set-ItemProperty -Path $key -Name "XL3Macros" -Type DWORD -Value 0x0 -Force
                Set-ItemProperty -Path $key -Name "XL2Macros" -Type DWORD -Value 0x0 -Force
            }
            "PowerPoint" {
                Set-ItemProperty -Path $key -Name "FilesBeforePowerPoint97" -Type DWORD -Value 0x0 -Force
                Set-ItemProperty -Path $key -Name "BinaryFiles" -Type DWORD -Value 0x0 -Force
                Set-ItemProperty -Path $key -Name "HTMLFiles" -Type DWORD -Value 0x0 -Force
                Set-ItemProperty -Path $key -Name "GraphicFilters" -Type DWORD -Value 0x0 -Force
                Set-ItemProperty -Path $key -Name "Outlines" -Type DWORD -Value 0x0 -Force
            }
        }        
    }
}





})


## Job: DisableFileValidationReporting, H:\dev.public\VM_Setup\03_Office\DisableFileValidationReporting.ps1
$jobs.Add("\03_Office\DisableFileValidationReporting.ps1", {

$OfficeVersions | ForEach-Object {
    $key = "HKCU:\Software\Microsoft\Office\" + $_ + "\Common\Security\FileValidation"
    ForceRegKey($key)
    Set-ItemProperty -Path $key -Name DisableReporting -Type DWORD -Value 0x1 -Force
}

})


## Job: DisableFirstRun, H:\dev.public\VM_Setup\03_Office\DisableFirstRun.ps1
$jobs.Add("\03_Office\DisableFirstRun.ps1", {
$OfficeVersions | ForEach-Object {
    $version = $_
    $key = "HKCU:\Software\Microsoft\Office\" + $version + "\" + $app + "\FirstRun"
    ForceRegKey($key)
    Set-ItemProperty -Path $key -Name "disablemovie" -Type DWORD -Value 0x1 -Force
    Set-ItemProperty -Path $key -Name "bootedrtm" -Type DWORD -Value 0x1 -Force
}
})


## Job: DisableHyperlinkWarning, H:\dev.public\VM_Setup\03_Office\DisableHyperlinkWarning.ps1
$jobs.Add("\03_Office\DisableHyperlinkWarning.ps1", {
$OfficeVersions | ForEach-Object {
    $key = "HKCU:\Software\Microsoft\Office\" + $_ + "\Common\Security"
    ForceRegKey($key)
    Set-ItemProperty -Path $key -Name "DisableHyperlinkWarning" -Type DWORD -Value 0x1 -Force
}

})


## Job: DisableProtectedView, H:\dev.public\VM_Setup\03_Office\DisableProtectedView.ps1
$jobs.Add("\03_Office\DisableProtectedView.ps1", {
@("Word", "Excel", "PowerPoint") | ForEach-Object {
    $app = $_
    $OfficeVersions | ForEach-Object {
        $version = $_
        $key = "HKCU:\Software\Microsoft\Office\" + $version + "\" + $app + "\Security\ProtectedView"
        ForceRegKey($key)
        Set-ItemProperty -Path $key -Name "DisableInternetFilesInPV" -Type DWORD -Value 0x1 -Force
        Set-ItemProperty -Path $key -Name "DisableAttachementsInPV" -Type DWORD -Value 0x1 -Force
        Set-ItemProperty -Path $key -Name "DisableUnsafeLocationsInPV" -Type DWORD -Value 0x1 -Force
    }
}

})


## Job: DisableReliabilityUpdate, H:\dev.public\VM_Setup\03_Office\DisableReliabilityUpdate.ps1
$jobs.Add("\03_Office\DisableReliabilityUpdate.ps1", {

$OfficeVersions | ForEach-Object {
    $key = "HKCU:\Software\Microsoft\Office\" + $_ + "\Common"
    ForceRegKey($key)
    Set-ItemProperty -Path $key -Name "UpdateReliabilityData" -Type DWORD -Value 0x0 -Force
}

})


## Job: DisableVBAWarnings, H:\dev.public\VM_Setup\03_Office\DisableVBAWarnings.ps1
$jobs.Add("\03_Office\DisableVBAWarnings.ps1", {

@("Word", "Excel", "PowerPoint", "Publisher", "MS Project", "Visio") | ForEach-Object {
    $app = $_
    $OfficeVersions | ForEach-Object {
        $version = $_
        $key = "HKCU:\Software\Microsoft\Office\" + $version + "\" + $app + "\Security"
        ForceRegKey($key)
        Set-ItemProperty -Path $key -Name "VBAWarnings" -Type DWORD -Value 0x1 -Force
    }
}

})


## Job: EnableAccessVBOM, H:\dev.public\VM_Setup\03_Office\EnableAccessVBOM.ps1
$jobs.Add("\03_Office\EnableAccessVBOM.ps1", {
@("Word", "Excel", "PowerPoint") | ForEach-Object {
    $app = $_
    $OfficeVersions | ForEach-Object {
        $version = $_
        $key = "HKCU:\Software\Microsoft\Office\" + $version + "\" + $app + "\Security"
        ForceRegKey($key)
        Set-ItemProperty -Path $key -Name "AccessVBOM" -Type DWORD -Value 0x1 -Force
    }
}

})


## Job: EnableActiveX, H:\dev.public\VM_Setup\03_Office\EnableActiveX.ps1
$jobs.Add("\03_Office\EnableActiveX.ps1", {
#Enable All ActiveX without SafeMode

$OfficeVersions | ForEach-Object {
    $key = "HKCU:\Software\Microsoft\Office\" + $_ + "\Common\Security"
    ForceRegKey($key)
    Set-ItemProperty -Path $key -Name "UFIControls" -Type DWORD -Value 0x1 -Force
}
})


## Job: EnableExcelDataConnections, H:\dev.public\VM_Setup\03_Office\EnableExcelDataConnections.ps1
$jobs.Add("\03_Office\EnableExcelDataConnections.ps1", {
$OfficeVersions | ForEach-Object {
    $key = "HKCU:\Software\Microsoft\Office\" + $_ + "\Excel\Security"
    ForceRegKey($key)
    Set-ItemProperty -Path $key -Name "DataConnectionWarnings" -Type DWORD -Value 0x0 -Force
}

})


## Job: EnableExcelLinkedWorkbooks, H:\dev.public\VM_Setup\03_Office\EnableExcelLinkedWorkbooks.ps1
$jobs.Add("\03_Office\EnableExcelLinkedWorkbooks.ps1", {
$OfficeVersions | ForEach-Object {
    $key = "HKCU:\Software\Microsoft\Office\" + $_ + "\Excel\Security"
    ForceRegKey($key)
    Set-ItemProperty -Path $key -Name "WorkbookLinkWarnings" -Type DWORD -Value 0x0 -Force
}

})


## Job: EnableFileValidationLogging, H:\dev.public\VM_Setup\03_Office\EnableFileValidationLogging.ps1
$jobs.Add("\03_Office\EnableFileValidationLogging.ps1", {
$OfficeVersions | ForEach-Object {
    $key = "HKCU:\Software\Microsoft\Office\" + $_ + "\Common"
    ForceRegKey($key)
    Set-ItemProperty -Path $key -Name EnableGKLogging -Type DWORD -Value 0x3 -Force
}
})


## Job: EnableFileValidationOnLoad, H:\dev.public\VM_Setup\03_Office\EnableFileValidationOnLoad.ps1
$jobs.Add("\03_Office\EnableFileValidationOnLoad.ps1", {
@("Word", "Excel", "PowerPoint") | ForEach-Object {
    $app = $_
    $OfficeVersions | ForEach-Object {
        $version = $_
        $key = "HKCU:\Software\Microsoft\Office\" + $version + "\" + $app + "\Security"
        ForceRegKey($key)
        Set-ItemProperty -Path $key -Name EnableGKOnLoad -Type DWORD -Value 0x3 -Force
    }
}

})


## Job: EnableFileValidationOnSave, H:\dev.public\VM_Setup\03_Office\EnableFileValidationOnSave.ps1
$jobs.Add("\03_Office\EnableFileValidationOnSave.ps1", {
@("Word", "Excel", "PowerPoint") | ForEach-Object {
    $app = $_
    $OfficeVersions | ForEach-Object {
        $version = $_
        $key = "HKCU:\Software\Microsoft\Office\" + $version + "\" + $app + "\Security"
        ForceRegKey($key)
        Set-ItemProperty -Path $key -Name EnableGKOnSave -Type DWORD -Value 0x3 -Force
    }
}

})


## Job: EnableMacros, H:\dev.public\VM_Setup\03_Office\EnableMacros.ps1
$jobs.Add("\03_Office\EnableMacros.ps1", {
$key = "HKCU:\Software\Policies\Microsoft\Office\Common\Security"
ForceRegKey($key)
Set-ItemProperty -Path $key -Name "automationsecurity" -value 1 -Force
})


## Job: EnableVBA, H:\dev.public\VM_Setup\03_Office\EnableVBA.ps1
$jobs.Add("\03_Office\EnableVBA.ps1", {


 $OfficeVersions | ForEach-Object {
    $version = $_
    $key = "HKCU:\Software\Microsoft\Office\" + $version + "\Common"
    ForceRegKey($key)
    Set-ItemProperty -Path $key -Name "vbaoff" -Type DWORD -Value 0 -Force
}

})


## Job: FakeOfficeMRU, H:\dev.public\VM_Setup\03_Office\FakeOfficeMRU.ps1
$jobs.Add("\03_Office\FakeOfficeMRU.ps1", {

$apps = @("Word", "Excel", "PowerPoint")

$baseFolder = Join-Path $home "Documents"

function RandomId {
    return [String]::Join('',(1..15 | % {"0123456789ABCDEF".ToCharArray() | Get-Random}))
}
function RandomExtension($app) {
    switch ($app) {
        "Word" { return @(".doc", ".docx") | Get-Random -Count 1}
        "Excel" { return @(".xls", ".xlsb", ".xlsx") | Get-Random -Count 1}
        "PowerPoint" { return @(".ppt", ".pptx") | Get-Random -Count 1}
        Default { return ".bin"}
    }
}
function RandomFileName($app) {
    return [String]::Join('',(1..20 | % {"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ01234567890".ToCharArray() | Get-Random})) + (RandomExtension($app))
}


$OfficeVersions| % {
    $v = $_
    $apps | % { 
        $a = $_
        $key_File = "HKCU:\Software\Microsoft\Office\" + $v + "\" + $a + "\File MRU"
        $key_Place = "HKCU:\Software\Microsoft\Office\" + $v + "\" + $a + "\Place MRU"

        ForceRegKey($key_File)
        ForceRegKey($key_Place)
        
        1..(Get-Random -Minimum 15 -Maximum 30)| % {
            $i = $_
            $id = RandomId
            $filename = RandomFileName
            $val = "[F00000000][T0" + $id + "][O00000000]*" + $baseFolder + "\" + $filename
            Set-ItemProperty $key_File -Name ("Item " + $i) -Value $val -Type String -Force
        }
    
        1..(Get-Random -Minimum 5 -Maximum 10)| % {
            $i = $_
            $id = RandomId
            $val = "[F00000000][T0" + $id + "][O00000000]*" + $baseFolder + "\"
            Set-ItemProperty $key_Place -Name ("Item " + $i) -Value $val -Type String -Force
        }
    }
}



})


## Job: SetSecurityLevel, H:\dev.public\VM_Setup\03_Office\SetSecurityLevel.ps1
$jobs.Add("\03_Office\SetSecurityLevel.ps1", {

@("Word", "Excel", "PowerPoint", "Publisher", "MS Project", "Visio") | ForEach-Object {
    $app = $_
    $OfficeVersions | ForEach-Object {
        $version = $_
        $key = "HKCU:\Software\Microsoft\Office\" + $version + "\" + $app + "\Security"
        ForceRegKey($key)
        Set-ItemProperty -Path $key -Name "Level" -Type DWORD -Value 0x0 -Force
    }
}

})

#Process All Jobs
Write-Progress -Activity "Processing Jobs" -Status "Starting..."
$i = 0
$jobs.Keys | % {
    $key = $_
    $i++
    Write-Progress -Activity "Processing Jobs" -Status $key -PercentComplete ($i / $jobs.Count * 100)
    Invoke-Command -ScriptBlock $jobs[$key] -ErrorAction Stop
}
Write-Progress -Activity "Processing Jobs" -Completed


