;==================================================
; 『神々の闇鍋』 ver.link方式
;==================================================

*start
[title name="神々の闇鍋"]
[hidemenubutton]
[wait time=500]
[freeimage layer="base"]

[bg storage=bg_roundtable.jpg time=1000]
[cm]

この天空の円卓に、三柱の神が集う。[l][r]
天照大御神、ゼウス神、ガネーシャ神――。[l][r]
今宵、世界の均衡を占う「闇鍋の儀」が始まる。[l][r]
選ばれし三つの象徴が、世界の運命を決する...[l][r]

[cm]
天照大御神は、何を鍋に捧げるだろうか。[l][r]
[link target=*ama_salt]→塩[endlink][r]
[link target=*ama_sun]→太陽[endlink][r]
[link target=*ama_fate]→運命[endlink][r]
[s]

*ama_salt
[eval exp="sf.ama_sel='塩'"]
[jump target=*zeus_select]

*ama_sun
[eval exp="sf.ama_sel='太陽'"]
[jump target=*zeus_select]

*ama_fate
[eval exp="sf.ama_sel='運命'"]
[jump target=*zeus_select]


*zeus_select
[cm]
ゼウス神は、何を捧げるだろうか。[l][r]
[link target=*zeus_grape]→葡萄[endlink][r]
[link target=*zeus_thunder]→雷[endlink][r]
[link target=*zeus_unity]→統一[endlink][r]
[s]

*zeus_grape
[eval exp="sf.zeus_sel='葡萄'"]
[jump target=*gane_select]

*zeus_thunder
[eval exp="sf.zeus_sel='雷'"]
[jump target=*gane_select]

*zeus_unity
[eval exp="sf.zeus_sel='統一'"]
[jump target=*gane_select]


*gane_select
[cm]
ガネーシャ神は、何を選ぶだろうか。[l][r]
[link target=*gane_wheat]→小麦[endlink][r]
[link target=*gane_book]→書物[endlink][r]
[link target=*gane_pray]→祈り[endlink][r]
[s]

*gane_wheat
[eval exp="sf.gane_sel='小麦'"]
[jump target=*judge]

*gane_book
[eval exp="sf.gane_sel='書物'"]
[jump target=*judge]

*gane_pray
[eval exp="sf.gane_sel='祈り'"]
[jump target=*judge]


;==================================================
; 判定
;==================================================
*judge
[cm]
闇鍋が静かに煮え立つ……。[l][r]
三つの象徴が、ひとつの光に溶け合う……。[l][r]


[iscript]
var sf = TYRANO.kag.variable.sf;   // ← sfを確実に参照
var a = sf.ama_sel;
var b = sf.zeus_sel;
var c = sf.gane_sel;
var res = "bad";

if ((a=="塩"&&b=="葡萄"&&c=="小麦")||(a=="太陽"&&b=="雷"&&c=="書物")||(a=="運命"&&b=="統一"&&c=="祈り")) {
    res = "normal";
}
else if (a=="太陽"&&b=="統一"&&c=="小麦") { res = "good_a"; }
else if (a=="運命"&&b=="雷"&&c=="書物") { res = "good_b"; }
else if (a=="塩"&&b=="雷"&&c=="祈り") { res = "good_c"; }
else if (a=="運命"&&b=="葡萄"&&c=="小麦") { res = "good_d"; }
else if (a=="太陽"&&b=="雷"&&c=="祈り") { res = "good_e"; }

sf.res = res;

TYRANO.kag.ftag.startTag("eval", {"exp":"sf.res='"+res+"'"});
[endscript]


[if exp="sf.res=='bad'"][jump target=*bad][endif]
[if exp="sf.res=='normal'"][jump target=*normal][endif]
[if exp="sf.res=='good_a'"][jump target=*good_a][endif]
[if exp="sf.res=='good_b'"][jump target=*good_b][endif]
[if exp="sf.res=='good_c'"][jump target=*good_c][endif]
[if exp="sf.res=='good_d'"][jump target=*good_d][endif]
[if exp="sf.res=='good_e'"][jump target=*good_e][endif]




;==================================================
; 各エンド
;==================================================

*bad
[bg storage=bg_roundtable.jpg time=1500]
[cm]
鍋は静かに沈黙した。[l][r]
香りも光も立たず、ただ深い闇のみが残る。[l][r]
神々は何も語らず、夜空だけが震えていた。[l][r]
[jump target=*result_bad]

*normal
[bg storage=bg_normal.jpg time=2000]
[trans method=fadein time=1500]
[cm]
鍋は静かに輝き、神々の特徴を宿した味わいを放った。[l][r]
世界はしばし、安らぎの調和に包まれた。[l][r]
[jump target=*result_normal]

*good_a
[bg storage=bg_good_a.jpg time=2000]
[trans method=fadein time=1500]
[cm]
黎明の光が、神々の手を包む。[l][r]
小麦の穂が風に揺れ、太陽が再び昇る。[l][r]
統一の誓いが天に響き、世界は新たに息づいた。[l][r]
黄金の鍋から溢れる光が、全てを赦すように広がる。[l][r]
その時、大地は静かに微笑んだ。[l][r]
[jump target=*result_good]

*good_b
[bg storage=bg_good_b.jpg time=2000]
[trans method=fadein time=1500]
[cm]
雷鳴が図書館を貫き、書物は白く燃えた。[l][r]
運命の言葉が天空に刻まれ、神々は沈黙の中で頷いた。[l][r]
鍋の中で光が脈打ち、記憶の鼓動となる。[l][r]
永遠の知が雷光とともに世界を照らす。[l][r]
その光は、未来そのものだった。[l][r]
[jump target=*result_good]

*good_c
[bg storage=bg_good_c.jpg time=2000]
[trans method=fadein time=1500]
[cm]
嵐の海に雷が走る。[l][r]
塩の波が神々の足元を洗い、祈りの声が空を満たす。[l][r]
鍋は青白く輝き、海と空とを結んだ。[l][r]
世界は深く息をし、再び秩序を取り戻す。[l][r]
静けさの中、神々は杯を交わした。[l][r]
[jump target=*result_good]

*good_d
[bg storage=bg_good_d.jpg time=2000]
[trans method=fadein time=1500]
[cm]
運命と小麦と葡萄が渦を巻く。[l][r]
黄金の光が鍋から立ち上り、豊穣の風が吹く。[l][r]
神々はその穂を掲げ、新たな命の循環を讃えた。[l][r]
世界は再び実りの季節を迎える。[l][r]
風が静かに、永遠を告げた。[l][r]
[jump target=*result_good]

*good_e
[bg storage=bg_good_e.jpg time=2000]
[trans method=fadein time=1500]
[cm]
太陽と雷が交わり、世界は白く燃えた。[l][r]
祈りが光となり、天と地を結ぶ架け橋を描く。[l][r]
鍋は聖なる脈動を放ち、神々の静寂に応える。[l][r]
その瞬間、すべての魂が一つに還った。[l][r]
再生の風が、永遠を告げた。[l][r]
[jump target=*result_good]


;==================================================
; 結果画面
;==================================================
*result_bad
[bg storage=bg_black.jpg time=1000]
[cm]
【 BAD END 】[l][r]
この鍋は、沈黙のまま終わった。[l][r]
[link target=*start]→再び儀へ戻る[endlink][r]
[s]

*result_normal
[bg storage=bg_black.jpg time=1000]
[cm]
【 NORMAL END 】[l][r]
調和の味わいが、世界を満たした。[l][r]
[link target=*start]→再び儀へ戻る[endlink][r]
[s]

*result_good
[bg storage=bg_black.jpg time=1000]
[cm]
【 GOOD END 】[l][r]
神々の力が、世界を再び照らした。[l][r]
[link target=*start]→再び儀へ戻る[endlink][r]
[s]
