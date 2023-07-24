fx_version 'cerulean'
game 'gta5'



supersede_radio "RADIO_01_CLASS_ROCK" { url = "https://radio5.domint.net:8222/stream", volume = 0.5, name = "Alofoke FM" } 
supersede_radio "RADIO_02_POP" { url = "https://radio4.domint.net:8050/stream", volume = 0.5, name = "Disco 106" }  ----- DETONAR
supersede_radio "RADIO_03_HIPHOP_NEW" { url = "https://radio.telemicro.com.do/mortal104", volume = 0.5, name = "Mortal FM" }   
supersede_radio "RADIO_04_PUNK" { url = "https://radio.yaservers.com:9990/;", volume = 0.5, name = "KQ 94.5" }  	
supersede_radio "RADIO_05_TALK_01" { url = "https://radio4.domint.net:8030/stream", volume = 0.5, name = "La Bakana" }  
supersede_radio "RADIO_06_COUNTRY" { url = "https://radio4.domint.net:8112/stream", volume = 0.5, name = "MiXX 104.5 " }  
supersede_radio "RADIO_07_DANCE_01" { url = "https://radio4.domint.net:8096/stream", volume = 0.5, name = "Power 103.7 " }  
supersede_radio "RADIO_08_MEXICAN" { url = "https://sp.sintonizapp.com:7025/stream", volume = 0.5, name = "La Invencible" }  
supersede_radio "RADIO_09_HIPHOP_OLD" { url = "https://s2.free-shoutcast.com/stream/18258", volume = 0.5, name = "Exa FM 96.9" }  
supersede_radio "RADIO_11_TALK_02" { url = "https://radio4.domint.net:8114/stream?dist=los40-web-live_streaming_play", volume = 0.7, name = "Los 40 Principales" }  
supersede_radio "RADIO_12_REGGAE" { url = "https://radio5.domint.net:8062/stream", volume = 0.5, name = "Radio Disney 97.3" }  
supersede_radio "RADIO_13_JAZZ" { url = "https://radio4.domint.net:8088/stream", volume = 0.5, name = "100.1 FM" }  
supersede_radio "RADIO_14_DANCE_02" { url = "https://node-20.zeno.fm/r66bf38wd0quv?zs=BKs8nzarQCCJ3jGKaI1mkA&rj-tok=AAABgAJZjOcAZoWzc1EuRb5FIQ&rj-ttl=5", volume = 0.5, name = "Ritmo 96.5" }  
supersede_radio "RADIO_15_MOTOWN" { url = "https://s01.digitalserver.org/8028/stream/1/", volume = 0.5, name = "Radio Cima" }  
supersede_radio "RADIO_16_SILVERLAKE" { url = "https://radios.xumcast.live/proxy/hilnplay/live", volume = 0.5, name = "La Nota 95.7" }  
supersede_radio "RADIO_17_FUNK" { url = "https://protvradiostream.com:8620/;", volume = 0.5, name = "Quisqueya FM" }  
supersede_radio "RADIO_18_90S_ROCK" { url = "https://rs5.domint.net:8188/stream", volume = 0.5, name = "Enamorada 99.9 FM" }  
supersede_radio "RADIO_19_USER" { url = "https://node-18.zeno.fm/eqm0as4whd0uv?zs=s0lZokRzTXmiSLrc0Hva9w&rj-tok=AAABgAJLbp0AidHzQpiOzDIH7A&rj-ttl=5", volume = 0.5, name = "Radio Son Dominicano" } 
supersede_radio "RADIO_20_THELAB" { url = "https://rs5.domint.net:8064/stream", volume = 0.5, name = "Caliente 104.1 FM" }  
supersede_radio "RADIO_21_DLC_XM17" { url = "https://15123.live.streamtheworld.com/Z101FM_SC", volume = 1.0, name = "Z 101" }  -------- 
supersede_radio "RADIO_22_DLC_BATTLE_MIX1_RADIO" { url = "https://radio5.domint.net:8110/stream", volume = 0.5, name = "Fuego 90 La Salsera" }  
supersede_radio "RADIO_23_DLC_XM19_RADIO" { url = "https://stream-10.zenomedia.com/bh0s950b9f0uv?zs=WxXoxolDTTuryCR-8JklQg", volume = 0.5, name = "Super K 100.7 FM" }  
--supersede_radio "RADIO_27_DLC_PRHEI4" { url = "https://rgradio.net/comando88/comando88.mp3", volume = 0.5, name = "Comando 88" }  
supersede_radio "RADIO_34_DLC_HEI4_KULT" { url = "https://audio.mmc.com.do/cdnlive", volume = 0.5, name = "CDN Radio" }  
supersede_radio "RADIO_35_DLC_HEI4_MLR" { url = "https://radio3.domint.net:8018/stream", volume = 0.5, name = "Radio Guarachita" }  
supersede_radio "RADIO_36_AUDIOPLAYER" { url = "https://visual.shoutca.st:8068/stream", volume = 0.5, name = "Azucar 89.1" }  
supersede_radio "RADIO_37_MOTOMAMI" { url = "https://rgradio.net/comando88/comando88.mp3", volume = 0.9, name = "Comando 88" }  -- hay que detonarte


--- You can find real life radio stream URLs at http://fmstream.org/country.htm ---


files {
	"index.html"
}

ui_page "index.html"

client_scripts {
	"data.js",
	"client.js"
}
