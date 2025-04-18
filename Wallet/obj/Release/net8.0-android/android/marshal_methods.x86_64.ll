; ModuleID = 'marshal_methods.x86_64.ll'
source_filename = "marshal_methods.x86_64.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [119 x ptr] zeroinitializer, align 16

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [238 x i64] [
	i64 98382396393917666, ; 0: Microsoft.Extensions.Primitives.dll => 0x15d8644ad360ce2 => 44
	i64 120698629574877762, ; 1: Mono.Android => 0x1accec39cafe242 => 118
	i64 131669012237370309, ; 2: Microsoft.Maui.Essentials.dll => 0x1d3c844de55c3c5 => 48
	i64 196720943101637631, ; 3: System.Linq.Expressions.dll => 0x2bae4a7cd73f3ff => 94
	i64 210515253464952879, ; 4: Xamarin.AndroidX.Collection.dll => 0x2ebe681f694702f => 58
	i64 232391251801502327, ; 5: Xamarin.AndroidX.SavedState.dll => 0x3399e9cbc897277 => 75
	i64 545109961164950392, ; 6: fi/Microsoft.Maui.Controls.resources.dll => 0x7909e9f1ec38b78 => 8
	i64 750875890346172408, ; 7: System.Threading.Thread => 0xa6ba5a4da7d1ff8 => 110
	i64 799765834175365804, ; 8: System.ComponentModel.dll => 0xb1956c9f18442ac => 88
	i64 849051935479314978, ; 9: hi/Microsoft.Maui.Controls.resources.dll => 0xbc8703ca21a3a22 => 11
	i64 870603111519317375, ; 10: SQLitePCLRaw.lib.e_sqlite3.android => 0xc1500ead2756d7f => 52
	i64 872800313462103108, ; 11: Xamarin.AndroidX.DrawerLayout => 0xc1ccf42c3c21c44 => 63
	i64 1120440138749646132, ; 12: Xamarin.Google.Android.Material.dll => 0xf8c9a5eae431534 => 79
	i64 1121665720830085036, ; 13: nb/Microsoft.Maui.Controls.resources.dll => 0xf90f507becf47ac => 19
	i64 1301485588176585670, ; 14: SQLitePCLRaw.core => 0x120fce3f338e43c6 => 51
	i64 1369545283391376210, ; 15: Xamarin.AndroidX.Navigation.Fragment.dll => 0x13019a2dd85acb52 => 71
	i64 1476839205573959279, ; 16: System.Net.Primitives.dll => 0x147ec96ece9b1e6f => 98
	i64 1486715745332614827, ; 17: Microsoft.Maui.Controls.dll => 0x14a1e017ea87d6ab => 45
	i64 1513467482682125403, ; 18: Mono.Android.Runtime => 0x1500eaa8245f6c5b => 117
	i64 1518315023656898250, ; 19: SQLitePCLRaw.provider.e_sqlite3 => 0x151223783a354eca => 53
	i64 1537168428375924959, ; 20: System.Threading.Thread.dll => 0x15551e8a954ae0df => 110
	i64 1556147632182429976, ; 21: ko/Microsoft.Maui.Controls.resources.dll => 0x15988c06d24c8918 => 17
	i64 1624659445732251991, ; 22: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0x168bf32877da9957 => 56
	i64 1628611045998245443, ; 23: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0x1699fd1e1a00b643 => 68
	i64 1672383392659050004, ; 24: Microsoft.Data.Sqlite.dll => 0x17357fd5bfb48e14 => 36
	i64 1743969030606105336, ; 25: System.Memory.dll => 0x1833d297e88f2af8 => 96
	i64 1767386781656293639, ; 26: System.Private.Uri.dll => 0x188704e9f5582107 => 102
	i64 1795316252682057001, ; 27: Xamarin.AndroidX.AppCompat.dll => 0x18ea3e9eac997529 => 55
	i64 1825687700144851180, ; 28: System.Runtime.InteropServices.RuntimeInformation.dll => 0x1956254a55ef08ec => 104
	i64 1835311033149317475, ; 29: es\Microsoft.Maui.Controls.resources => 0x197855a927386163 => 7
	i64 1836611346387731153, ; 30: Xamarin.AndroidX.SavedState => 0x197cf449ebe482d1 => 75
	i64 1881198190668717030, ; 31: tr\Microsoft.Maui.Controls.resources => 0x1a1b5bc992ea9be6 => 29
	i64 1920760634179481754, ; 32: Microsoft.Maui.Controls.Xaml => 0x1aa7e99ec2d2709a => 46
	i64 1959996714666907089, ; 33: tr/Microsoft.Maui.Controls.resources.dll => 0x1b334ea0a2a755d1 => 29
	i64 1981742497975770890, ; 34: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x1b80904d5c241f0a => 67
	i64 1983698669889758782, ; 35: cs/Microsoft.Maui.Controls.resources.dll => 0x1b87836e2031a63e => 3
	i64 2019660174692588140, ; 36: pl/Microsoft.Maui.Controls.resources.dll => 0x1c07463a6f8e1a6c => 21
	i64 2262844636196693701, ; 37: Xamarin.AndroidX.DrawerLayout.dll => 0x1f673d352266e6c5 => 63
	i64 2287834202362508563, ; 38: System.Collections.Concurrent => 0x1fc00515e8ce7513 => 83
	i64 2302323944321350744, ; 39: ru/Microsoft.Maui.Controls.resources.dll => 0x1ff37f6ddb267c58 => 25
	i64 2329709569556905518, ; 40: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x2054ca829b447e2e => 66
	i64 2470498323731680442, ; 41: Xamarin.AndroidX.CoordinatorLayout => 0x2248f922dc398cba => 59
	i64 2497223385847772520, ; 42: System.Runtime => 0x22a7eb7046413568 => 107
	i64 2547086958574651984, ; 43: Xamarin.AndroidX.Activity.dll => 0x2359121801df4a50 => 54
	i64 2602673633151553063, ; 44: th\Microsoft.Maui.Controls.resources => 0x241e8de13a460e27 => 28
	i64 2656907746661064104, ; 45: Microsoft.Extensions.DependencyInjection => 0x24df3b84c8b75da8 => 39
	i64 2662981627730767622, ; 46: cs\Microsoft.Maui.Controls.resources => 0x24f4cfae6c48af06 => 3
	i64 2895129759130297543, ; 47: fi\Microsoft.Maui.Controls.resources => 0x282d912d479fa4c7 => 8
	i64 3017704767998173186, ; 48: Xamarin.Google.Android.Material => 0x29e10a7f7d88a002 => 79
	i64 3289520064315143713, ; 49: Xamarin.AndroidX.Lifecycle.Common => 0x2da6b911e3063621 => 65
	i64 3311221304742556517, ; 50: System.Numerics.Vectors.dll => 0x2df3d23ba9e2b365 => 100
	i64 3344514922410554693, ; 51: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x2e6a1a9a18463545 => 81
	i64 3429672777697402584, ; 52: Microsoft.Maui.Essentials => 0x2f98a5385a7b1ed8 => 48
	i64 3494946837667399002, ; 53: Microsoft.Extensions.Configuration => 0x30808ba1c00a455a => 37
	i64 3522470458906976663, ; 54: Xamarin.AndroidX.SwipeRefreshLayout => 0x30e2543832f52197 => 76
	i64 3551103847008531295, ; 55: System.Private.CoreLib.dll => 0x31480e226177735f => 115
	i64 3567343442040498961, ; 56: pt\Microsoft.Maui.Controls.resources => 0x3181bff5bea4ab11 => 23
	i64 3571415421602489686, ; 57: System.Runtime.dll => 0x319037675df7e556 => 107
	i64 3638003163729360188, ; 58: Microsoft.Extensions.Configuration.Abstractions => 0x327cc89a39d5f53c => 38
	i64 3647754201059316852, ; 59: System.Xml.ReaderWriter => 0x329f6d1e86145474 => 112
	i64 3655542548057982301, ; 60: Microsoft.Extensions.Configuration.dll => 0x32bb18945e52855d => 37
	i64 3716579019761409177, ; 61: netstandard.dll => 0x3393f0ed5c8c5c99 => 114
	i64 3727469159507183293, ; 62: Xamarin.AndroidX.RecyclerView => 0x33baa1739ba646bd => 74
	i64 3869221888984012293, ; 63: Microsoft.Extensions.Logging.dll => 0x35b23cceda0ed605 => 41
	i64 3890352374528606784, ; 64: Microsoft.Maui.Controls.Xaml.dll => 0x35fd4edf66e00240 => 46
	i64 3933965368022646939, ; 65: System.Net.Requests => 0x369840a8bfadc09b => 99
	i64 3966267475168208030, ; 66: System.Memory => 0x370b03412596249e => 96
	i64 4073500526318903918, ; 67: System.Private.Xml.dll => 0x3887fb25779ae26e => 103
	i64 4120493066591692148, ; 68: zh-Hant\Microsoft.Maui.Controls.resources => 0x392eee9cdda86574 => 34
	i64 4154383907710350974, ; 69: System.ComponentModel => 0x39a7562737acb67e => 88
	i64 4187479170553454871, ; 70: System.Linq.Expressions => 0x3a1cea1e912fa117 => 94
	i64 4205801962323029395, ; 71: System.ComponentModel.TypeConverter => 0x3a5e0299f7e7ad93 => 87
	i64 4337444564132831293, ; 72: SQLitePCLRaw.batteries_v2.dll => 0x3c31b2d9ae16203d => 50
	i64 4356591372459378815, ; 73: vi/Microsoft.Maui.Controls.resources.dll => 0x3c75b8c562f9087f => 31
	i64 4471008908234234057, ; 74: ar/Wallet.resources.dll => 0x3e0c36e9e2e898c9 => 0
	i64 4679594760078841447, ; 75: ar/Microsoft.Maui.Controls.resources.dll => 0x40f142a407475667 => 1
	i64 4794310189461587505, ; 76: Xamarin.AndroidX.Activity => 0x4288cfb749e4c631 => 54
	i64 4795410492532947900, ; 77: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0x428cb86f8f9b7bbc => 76
	i64 4853321196694829351, ; 78: System.Runtime.Loader.dll => 0x435a75ea15de7927 => 106
	i64 5129462924058778861, ; 79: Microsoft.Data.Sqlite => 0x472f835a350f5ced => 36
	i64 5290786973231294105, ; 80: System.Runtime.Loader => 0x496ca6b869b72699 => 106
	i64 5423376490970181369, ; 81: System.Runtime.InteropServices.RuntimeInformation => 0x4b43b42f2b7b6ef9 => 104
	i64 5471532531798518949, ; 82: sv\Microsoft.Maui.Controls.resources => 0x4beec9d926d82ca5 => 27
	i64 5522859530602327440, ; 83: uk\Microsoft.Maui.Controls.resources => 0x4ca5237b51eead90 => 30
	i64 5570799893513421663, ; 84: System.IO.Compression.Brotli => 0x4d4f74fcdfa6c35f => 92
	i64 5573260873512690141, ; 85: System.Security.Cryptography.dll => 0x4d58333c6e4ea1dd => 108
	i64 5692067934154308417, ; 86: Xamarin.AndroidX.ViewPager2.dll => 0x4efe49a0d4a8bb41 => 78
	i64 6068057819846744445, ; 87: ro/Microsoft.Maui.Controls.resources.dll => 0x5436126fec7f197d => 24
	i64 6183170893902868313, ; 88: SQLitePCLRaw.batteries_v2 => 0x55cf092b0c9d6f59 => 50
	i64 6200764641006662125, ; 89: ro\Microsoft.Maui.Controls.resources => 0x560d8a96830131ed => 24
	i64 6357457916754632952, ; 90: _Microsoft.Android.Resource.Designer => 0x583a3a4ac2a7a0f8 => 35
	i64 6401687960814735282, ; 91: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0x58d75d486341cfb2 => 66
	i64 6478287442656530074, ; 92: hr\Microsoft.Maui.Controls.resources => 0x59e7801b0c6a8e9a => 12
	i64 6548213210057960872, ; 93: Xamarin.AndroidX.CustomView.dll => 0x5adfed387b066da8 => 62
	i64 6560151584539558821, ; 94: Microsoft.Extensions.Options => 0x5b0a571be53243a5 => 43
	i64 6644795250349821943, ; 95: Wallet.dll => 0x5c370e13164dcff7 => 82
	i64 6743165466166707109, ; 96: nl\Microsoft.Maui.Controls.resources => 0x5d948943c08c43a5 => 20
	i64 6777482997383978746, ; 97: pt/Microsoft.Maui.Controls.resources.dll => 0x5e0e74e0a2525efa => 23
	i64 6894844156784520562, ; 98: System.Numerics.Vectors => 0x5faf683aead1ad72 => 100
	i64 7220009545223068405, ; 99: sv/Microsoft.Maui.Controls.resources.dll => 0x6432a06d99f35af5 => 27
	i64 7270811800166795866, ; 100: System.Linq => 0x64e71ccf51a90a5a => 95
	i64 7377312882064240630, ; 101: System.ComponentModel.TypeConverter.dll => 0x66617afac45a2ff6 => 87
	i64 7489048572193775167, ; 102: System.ObjectModel => 0x67ee71ff6b419e3f => 101
	i64 7654504624184590948, ; 103: System.Net.Http => 0x6a3a4366801b8264 => 97
	i64 7708790323521193081, ; 104: ms/Microsoft.Maui.Controls.resources.dll => 0x6afb1ff4d1730479 => 18
	i64 7714652370974252055, ; 105: System.Private.CoreLib => 0x6b0ff375198b9c17 => 115
	i64 7735352534559001595, ; 106: Xamarin.Kotlin.StdLib.dll => 0x6b597e2582ce8bfb => 80
	i64 7836164640616011524, ; 107: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x6cbfa6390d64d704 => 56
	i64 8064050204834738623, ; 108: System.Collections.dll => 0x6fe942efa61731bf => 85
	i64 8083354569033831015, ; 109: Xamarin.AndroidX.Lifecycle.Common.dll => 0x702dd82730cad267 => 65
	i64 8087206902342787202, ; 110: System.Diagnostics.DiagnosticSource => 0x703b87d46f3aa082 => 91
	i64 8167236081217502503, ; 111: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 116
	i64 8185542183669246576, ; 112: System.Collections => 0x7198e33f4794aa70 => 85
	i64 8246048515196606205, ; 113: Microsoft.Maui.Graphics.dll => 0x726fd96f64ee56fd => 49
	i64 8368701292315763008, ; 114: System.Security.Cryptography => 0x7423997c6fd56140 => 108
	i64 8400357532724379117, ; 115: Xamarin.AndroidX.Navigation.UI.dll => 0x749410ab44503ded => 73
	i64 8563666267364444763, ; 116: System.Private.Uri => 0x76d841191140ca5b => 102
	i64 8614108721271900878, ; 117: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x778b763e14018ace => 22
	i64 8626175481042262068, ; 118: Java.Interop => 0x77b654e585b55834 => 116
	i64 8639588376636138208, ; 119: Xamarin.AndroidX.Navigation.Runtime => 0x77e5fbdaa2fda2e0 => 72
	i64 8677882282824630478, ; 120: pt-BR\Microsoft.Maui.Controls.resources => 0x786e07f5766b00ce => 22
	i64 8725526185868997716, ; 121: System.Diagnostics.DiagnosticSource.dll => 0x79174bd613173454 => 91
	i64 9045785047181495996, ; 122: zh-HK\Microsoft.Maui.Controls.resources => 0x7d891592e3cb0ebc => 32
	i64 9312692141327339315, ; 123: Xamarin.AndroidX.ViewPager2 => 0x813d54296a634f33 => 78
	i64 9324707631942237306, ; 124: Xamarin.AndroidX.AppCompat => 0x8168042fd44a7c7a => 55
	i64 9659729154652888475, ; 125: System.Text.RegularExpressions => 0x860e407c9991dd9b => 109
	i64 9678050649315576968, ; 126: Xamarin.AndroidX.CoordinatorLayout.dll => 0x864f57c9feb18c88 => 59
	i64 9702891218465930390, ; 127: System.Collections.NonGeneric.dll => 0x86a79827b2eb3c96 => 84
	i64 9808709177481450983, ; 128: Mono.Android.dll => 0x881f890734e555e7 => 118
	i64 9956195530459977388, ; 129: Microsoft.Maui => 0x8a2b8315b36616ac => 47
	i64 9991543690424095600, ; 130: es/Microsoft.Maui.Controls.resources.dll => 0x8aa9180c89861370 => 7
	i64 10038780035334861115, ; 131: System.Net.Http.dll => 0x8b50e941206af13b => 97
	i64 10051358222726253779, ; 132: System.Private.Xml => 0x8b7d990c97ccccd3 => 103
	i64 10092835686693276772, ; 133: Microsoft.Maui.Controls => 0x8c10f49539bd0c64 => 45
	i64 10143853363526200146, ; 134: da\Microsoft.Maui.Controls.resources => 0x8cc634e3c2a16b52 => 4
	i64 10229024438826829339, ; 135: Xamarin.AndroidX.CustomView => 0x8df4cb880b10061b => 62
	i64 10406448008575299332, ; 136: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x906b2153fcb3af04 => 81
	i64 10430153318873392755, ; 137: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 60
	i64 10506226065143327199, ; 138: ca\Microsoft.Maui.Controls.resources => 0x91cd9cf11ed169df => 2
	i64 10785150219063592792, ; 139: System.Net.Primitives => 0x95ac8cfb68830758 => 98
	i64 11002576679268595294, ; 140: Microsoft.Extensions.Logging.Abstractions => 0x98b1013215cd365e => 42
	i64 11009005086950030778, ; 141: Microsoft.Maui.dll => 0x98c7d7cc621ffdba => 47
	i64 11103970607964515343, ; 142: hu\Microsoft.Maui.Controls.resources => 0x9a193a6fc41a6c0f => 13
	i64 11162124722117608902, ; 143: Xamarin.AndroidX.ViewPager => 0x9ae7d54b986d05c6 => 77
	i64 11220793807500858938, ; 144: ja\Microsoft.Maui.Controls.resources => 0x9bb8448481fdd63a => 16
	i64 11226290749488709958, ; 145: Microsoft.Extensions.Options.dll => 0x9bcbcbf50c874146 => 43
	i64 11340910727871153756, ; 146: Xamarin.AndroidX.CursorAdapter => 0x9d630238642d465c => 61
	i64 11485890710487134646, ; 147: System.Runtime.InteropServices => 0x9f6614bf0f8b71b6 => 105
	i64 11518296021396496455, ; 148: id\Microsoft.Maui.Controls.resources => 0x9fd9353475222047 => 14
	i64 11529969570048099689, ; 149: Xamarin.AndroidX.ViewPager.dll => 0xa002ae3c4dc7c569 => 77
	i64 11530571088791430846, ; 150: Microsoft.Extensions.Logging => 0xa004d1504ccd66be => 41
	i64 11597940890313164233, ; 151: netstandard => 0xa0f429ca8d1805c9 => 114
	i64 11705530742807338875, ; 152: he/Microsoft.Maui.Controls.resources.dll => 0xa272663128721f7b => 10
	i64 12279246230491828964, ; 153: SQLitePCLRaw.provider.e_sqlite3.dll => 0xaa68a5636e0512e4 => 53
	i64 12451044538927396471, ; 154: Xamarin.AndroidX.Fragment.dll => 0xaccaff0a2955b677 => 64
	i64 12466513435562512481, ; 155: Xamarin.AndroidX.Loader.dll => 0xad01f3eb52569061 => 69
	i64 12475113361194491050, ; 156: _Microsoft.Android.Resource.Designer.dll => 0xad2081818aba1caa => 35
	i64 12538491095302438457, ; 157: Xamarin.AndroidX.CardView.dll => 0xae01ab382ae67e39 => 57
	i64 12550732019250633519, ; 158: System.IO.Compression => 0xae2d28465e8e1b2f => 93
	i64 12681088699309157496, ; 159: it/Microsoft.Maui.Controls.resources.dll => 0xaffc46fc178aec78 => 15
	i64 12700543734426720211, ; 160: Xamarin.AndroidX.Collection => 0xb041653c70d157d3 => 58
	i64 12823819093633476069, ; 161: th/Microsoft.Maui.Controls.resources.dll => 0xb1f75b85abe525e5 => 28
	i64 12843321153144804894, ; 162: Microsoft.Extensions.Primitives => 0xb23ca48abd74d61e => 44
	i64 13221551921002590604, ; 163: ca/Microsoft.Maui.Controls.resources.dll => 0xb77c636bdebe318c => 2
	i64 13222659110913276082, ; 164: ja/Microsoft.Maui.Controls.resources.dll => 0xb78052679c1178b2 => 16
	i64 13343850469010654401, ; 165: Mono.Android.Runtime.dll => 0xb92ee14d854f44c1 => 117
	i64 13381594904270902445, ; 166: he\Microsoft.Maui.Controls.resources => 0xb9b4f9aaad3e94ad => 10
	i64 13465488254036897740, ; 167: Xamarin.Kotlin.StdLib => 0xbadf06394d106fcc => 80
	i64 13467053111158216594, ; 168: uk/Microsoft.Maui.Controls.resources.dll => 0xbae49573fde79792 => 30
	i64 13540124433173649601, ; 169: vi\Microsoft.Maui.Controls.resources => 0xbbe82f6eede718c1 => 31
	i64 13545416393490209236, ; 170: id/Microsoft.Maui.Controls.resources.dll => 0xbbfafc7174bc99d4 => 14
	i64 13572454107664307259, ; 171: Xamarin.AndroidX.RecyclerView.dll => 0xbc5b0b19d99f543b => 74
	i64 13717397318615465333, ; 172: System.ComponentModel.Primitives.dll => 0xbe5dfc2ef2f87d75 => 86
	i64 13755568601956062840, ; 173: fr/Microsoft.Maui.Controls.resources.dll => 0xbee598c36b1b9678 => 9
	i64 13814445057219246765, ; 174: hr/Microsoft.Maui.Controls.resources.dll => 0xbfb6c49664b43aad => 12
	i64 13881769479078963060, ; 175: System.Console.dll => 0xc0a5f3cade5c6774 => 89
	i64 13959074834287824816, ; 176: Xamarin.AndroidX.Fragment => 0xc1b8989a7ad20fb0 => 64
	i64 14100563506285742564, ; 177: da/Microsoft.Maui.Controls.resources.dll => 0xc3af43cd0cff89e4 => 4
	i64 14124974489674258913, ; 178: Xamarin.AndroidX.CardView => 0xc405fd76067d19e1 => 57
	i64 14125464355221830302, ; 179: System.Threading.dll => 0xc407bafdbc707a9e => 111
	i64 14461014870687870182, ; 180: System.Net.Requests.dll => 0xc8afd8683afdece6 => 99
	i64 14464374589798375073, ; 181: ru\Microsoft.Maui.Controls.resources => 0xc8bbc80dcb1e5ea1 => 25
	i64 14522721392235705434, ; 182: el/Microsoft.Maui.Controls.resources.dll => 0xc98b12295c2cf45a => 6
	i64 14669215534098758659, ; 183: Microsoft.Extensions.DependencyInjection.dll => 0xcb9385ceb3993c03 => 39
	i64 14705122255218365489, ; 184: ko\Microsoft.Maui.Controls.resources => 0xcc1316c7b0fb5431 => 17
	i64 14744092281598614090, ; 185: zh-Hans\Microsoft.Maui.Controls.resources => 0xcc9d89d004439a4a => 33
	i64 14852515768018889994, ; 186: Xamarin.AndroidX.CursorAdapter.dll => 0xce1ebc6625a76d0a => 61
	i64 14892012299694389861, ; 187: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xceab0e490a083a65 => 34
	i64 14904040806490515477, ; 188: ar\Microsoft.Maui.Controls.resources => 0xced5ca2604cb2815 => 1
	i64 14954917835170835695, ; 189: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xcf8a8a895a82ecef => 40
	i64 14987728460634540364, ; 190: System.IO.Compression.dll => 0xcfff1ba06622494c => 93
	i64 15076659072870671916, ; 191: System.ObjectModel.dll => 0xd13b0d8c1620662c => 101
	i64 15111608613780139878, ; 192: ms\Microsoft.Maui.Controls.resources => 0xd1b737f831192f66 => 18
	i64 15115185479366240210, ; 193: System.IO.Compression.Brotli.dll => 0xd1c3ed1c1bc467d2 => 92
	i64 15133485256822086103, ; 194: System.Linq.dll => 0xd204f0a9127dd9d7 => 95
	i64 15227001540531775957, ; 195: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd3512d3999b8e9d5 => 38
	i64 15370334346939861994, ; 196: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 60
	i64 15391712275433856905, ; 197: Microsoft.Extensions.DependencyInjection.Abstractions => 0xd59a58c406411f89 => 40
	i64 15527772828719725935, ; 198: System.Console => 0xd77dbb1e38cd3d6f => 89
	i64 15536481058354060254, ; 199: de\Microsoft.Maui.Controls.resources => 0xd79cab34eec75bde => 5
	i64 15582737692548360875, ; 200: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xd841015ed86f6aab => 68
	i64 15609085926864131306, ; 201: System.dll => 0xd89e9cf3334914ea => 113
	i64 15661133872274321916, ; 202: System.Xml.ReaderWriter.dll => 0xd9578647d4bfb1fc => 112
	i64 15664356999916475676, ; 203: de/Microsoft.Maui.Controls.resources.dll => 0xd962f9b2b6ecd51c => 5
	i64 15743187114543869802, ; 204: hu/Microsoft.Maui.Controls.resources.dll => 0xda7b09450ae4ef6a => 13
	i64 15783653065526199428, ; 205: el\Microsoft.Maui.Controls.resources => 0xdb0accd674b1c484 => 6
	i64 16154507427712707110, ; 206: System => 0xe03056ea4e39aa26 => 113
	i64 16173688299253715510, ; 207: ar\Wallet.resources => 0xe0747bd0f8e8d236 => 0
	i64 16288847719894691167, ; 208: nb\Microsoft.Maui.Controls.resources => 0xe20d9cb300c12d5f => 19
	i64 16321164108206115771, ; 209: Microsoft.Extensions.Logging.Abstractions.dll => 0xe2806c487e7b0bbb => 42
	i64 16485852232405450151, ; 210: Wallet => 0xe4c98342741b7da7 => 82
	i64 16649148416072044166, ; 211: Microsoft.Maui.Graphics => 0xe70da84600bb4e86 => 49
	i64 16677317093839702854, ; 212: Xamarin.AndroidX.Navigation.UI => 0xe771bb8960dd8b46 => 73
	i64 16755018182064898362, ; 213: SQLitePCLRaw.core.dll => 0xe885c843c330813a => 51
	i64 16856067890322379635, ; 214: System.Data.Common.dll => 0xe9ecc87060889373 => 90
	i64 16890310621557459193, ; 215: System.Text.RegularExpressions.dll => 0xea66700587f088f9 => 109
	i64 16942731696432749159, ; 216: sk\Microsoft.Maui.Controls.resources => 0xeb20acb622a01a67 => 26
	i64 16998075588627545693, ; 217: Xamarin.AndroidX.Navigation.Fragment => 0xebe54bb02d623e5d => 71
	i64 17008137082415910100, ; 218: System.Collections.NonGeneric => 0xec090a90408c8cd4 => 84
	i64 17031351772568316411, ; 219: Xamarin.AndroidX.Navigation.Common.dll => 0xec5b843380a769fb => 70
	i64 17062143951396181894, ; 220: System.ComponentModel.Primitives => 0xecc8e986518c9786 => 86
	i64 17089008752050867324, ; 221: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xed285aeb25888c7c => 33
	i64 17260702271250283638, ; 222: System.Data.Common => 0xef8a5543bba6bc76 => 90
	i64 17342750010158924305, ; 223: hi\Microsoft.Maui.Controls.resources => 0xf0add33f97ecc211 => 11
	i64 17438153253682247751, ; 224: sk/Microsoft.Maui.Controls.resources.dll => 0xf200c3fe308d7847 => 26
	i64 17514990004910432069, ; 225: fr\Microsoft.Maui.Controls.resources => 0xf311be9c6f341f45 => 9
	i64 17623389608345532001, ; 226: pl\Microsoft.Maui.Controls.resources => 0xf492db79dfbef661 => 21
	i64 17702523067201099846, ; 227: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xf5abfef008ae1846 => 32
	i64 17704177640604968747, ; 228: Xamarin.AndroidX.Loader => 0xf5b1dfc36cac272b => 69
	i64 17710060891934109755, ; 229: Xamarin.AndroidX.Lifecycle.ViewModel => 0xf5c6c68c9e45303b => 67
	i64 17712670374920797664, ; 230: System.Runtime.InteropServices.dll => 0xf5d00bdc38bd3de0 => 105
	i64 18025913125965088385, ; 231: System.Threading => 0xfa28e87b91334681 => 111
	i64 18099568558057551825, ; 232: nl/Microsoft.Maui.Controls.resources.dll => 0xfb2e95b53ad977d1 => 20
	i64 18121036031235206392, ; 233: Xamarin.AndroidX.Navigation.Common => 0xfb7ada42d3d42cf8 => 70
	i64 18245806341561545090, ; 234: System.Collections.Concurrent.dll => 0xfd3620327d587182 => 83
	i64 18305135509493619199, ; 235: Xamarin.AndroidX.Navigation.Runtime.dll => 0xfe08e7c2d8c199ff => 72
	i64 18324163916253801303, ; 236: it\Microsoft.Maui.Controls.resources => 0xfe4c81ff0a56ab57 => 15
	i64 18370042311372477656 ; 237: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0xfeef80274e4094d8 => 52
], align 16

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [238 x i32] [
	i32 44, ; 0
	i32 118, ; 1
	i32 48, ; 2
	i32 94, ; 3
	i32 58, ; 4
	i32 75, ; 5
	i32 8, ; 6
	i32 110, ; 7
	i32 88, ; 8
	i32 11, ; 9
	i32 52, ; 10
	i32 63, ; 11
	i32 79, ; 12
	i32 19, ; 13
	i32 51, ; 14
	i32 71, ; 15
	i32 98, ; 16
	i32 45, ; 17
	i32 117, ; 18
	i32 53, ; 19
	i32 110, ; 20
	i32 17, ; 21
	i32 56, ; 22
	i32 68, ; 23
	i32 36, ; 24
	i32 96, ; 25
	i32 102, ; 26
	i32 55, ; 27
	i32 104, ; 28
	i32 7, ; 29
	i32 75, ; 30
	i32 29, ; 31
	i32 46, ; 32
	i32 29, ; 33
	i32 67, ; 34
	i32 3, ; 35
	i32 21, ; 36
	i32 63, ; 37
	i32 83, ; 38
	i32 25, ; 39
	i32 66, ; 40
	i32 59, ; 41
	i32 107, ; 42
	i32 54, ; 43
	i32 28, ; 44
	i32 39, ; 45
	i32 3, ; 46
	i32 8, ; 47
	i32 79, ; 48
	i32 65, ; 49
	i32 100, ; 50
	i32 81, ; 51
	i32 48, ; 52
	i32 37, ; 53
	i32 76, ; 54
	i32 115, ; 55
	i32 23, ; 56
	i32 107, ; 57
	i32 38, ; 58
	i32 112, ; 59
	i32 37, ; 60
	i32 114, ; 61
	i32 74, ; 62
	i32 41, ; 63
	i32 46, ; 64
	i32 99, ; 65
	i32 96, ; 66
	i32 103, ; 67
	i32 34, ; 68
	i32 88, ; 69
	i32 94, ; 70
	i32 87, ; 71
	i32 50, ; 72
	i32 31, ; 73
	i32 0, ; 74
	i32 1, ; 75
	i32 54, ; 76
	i32 76, ; 77
	i32 106, ; 78
	i32 36, ; 79
	i32 106, ; 80
	i32 104, ; 81
	i32 27, ; 82
	i32 30, ; 83
	i32 92, ; 84
	i32 108, ; 85
	i32 78, ; 86
	i32 24, ; 87
	i32 50, ; 88
	i32 24, ; 89
	i32 35, ; 90
	i32 66, ; 91
	i32 12, ; 92
	i32 62, ; 93
	i32 43, ; 94
	i32 82, ; 95
	i32 20, ; 96
	i32 23, ; 97
	i32 100, ; 98
	i32 27, ; 99
	i32 95, ; 100
	i32 87, ; 101
	i32 101, ; 102
	i32 97, ; 103
	i32 18, ; 104
	i32 115, ; 105
	i32 80, ; 106
	i32 56, ; 107
	i32 85, ; 108
	i32 65, ; 109
	i32 91, ; 110
	i32 116, ; 111
	i32 85, ; 112
	i32 49, ; 113
	i32 108, ; 114
	i32 73, ; 115
	i32 102, ; 116
	i32 22, ; 117
	i32 116, ; 118
	i32 72, ; 119
	i32 22, ; 120
	i32 91, ; 121
	i32 32, ; 122
	i32 78, ; 123
	i32 55, ; 124
	i32 109, ; 125
	i32 59, ; 126
	i32 84, ; 127
	i32 118, ; 128
	i32 47, ; 129
	i32 7, ; 130
	i32 97, ; 131
	i32 103, ; 132
	i32 45, ; 133
	i32 4, ; 134
	i32 62, ; 135
	i32 81, ; 136
	i32 60, ; 137
	i32 2, ; 138
	i32 98, ; 139
	i32 42, ; 140
	i32 47, ; 141
	i32 13, ; 142
	i32 77, ; 143
	i32 16, ; 144
	i32 43, ; 145
	i32 61, ; 146
	i32 105, ; 147
	i32 14, ; 148
	i32 77, ; 149
	i32 41, ; 150
	i32 114, ; 151
	i32 10, ; 152
	i32 53, ; 153
	i32 64, ; 154
	i32 69, ; 155
	i32 35, ; 156
	i32 57, ; 157
	i32 93, ; 158
	i32 15, ; 159
	i32 58, ; 160
	i32 28, ; 161
	i32 44, ; 162
	i32 2, ; 163
	i32 16, ; 164
	i32 117, ; 165
	i32 10, ; 166
	i32 80, ; 167
	i32 30, ; 168
	i32 31, ; 169
	i32 14, ; 170
	i32 74, ; 171
	i32 86, ; 172
	i32 9, ; 173
	i32 12, ; 174
	i32 89, ; 175
	i32 64, ; 176
	i32 4, ; 177
	i32 57, ; 178
	i32 111, ; 179
	i32 99, ; 180
	i32 25, ; 181
	i32 6, ; 182
	i32 39, ; 183
	i32 17, ; 184
	i32 33, ; 185
	i32 61, ; 186
	i32 34, ; 187
	i32 1, ; 188
	i32 40, ; 189
	i32 93, ; 190
	i32 101, ; 191
	i32 18, ; 192
	i32 92, ; 193
	i32 95, ; 194
	i32 38, ; 195
	i32 60, ; 196
	i32 40, ; 197
	i32 89, ; 198
	i32 5, ; 199
	i32 68, ; 200
	i32 113, ; 201
	i32 112, ; 202
	i32 5, ; 203
	i32 13, ; 204
	i32 6, ; 205
	i32 113, ; 206
	i32 0, ; 207
	i32 19, ; 208
	i32 42, ; 209
	i32 82, ; 210
	i32 49, ; 211
	i32 73, ; 212
	i32 51, ; 213
	i32 90, ; 214
	i32 109, ; 215
	i32 26, ; 216
	i32 71, ; 217
	i32 84, ; 218
	i32 70, ; 219
	i32 86, ; 220
	i32 33, ; 221
	i32 90, ; 222
	i32 11, ; 223
	i32 26, ; 224
	i32 9, ; 225
	i32 21, ; 226
	i32 32, ; 227
	i32 69, ; 228
	i32 67, ; 229
	i32 105, ; 230
	i32 111, ; 231
	i32 20, ; 232
	i32 70, ; 233
	i32 83, ; 234
	i32 72, ; 235
	i32 15, ; 236
	i32 52 ; 237
], align 16

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 16

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ df9aaf29a52042a4fbf800daf2f3a38964b9e958"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
