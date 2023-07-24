/*

** UM Loading Screen Install **
1- Watch this first = https://streamable.com/nsv7dx
**{If you don't have a github account https://github.com/signup?source=login}

2- When you finish the video = open steamkey.lua and paste your steamkey "here"
3 - The is finished, thanks for your support

*/
UM = [];

UM.XMAS = false;

UM.GithubUserName = "Bakisito";
UM.Logo = "one-republic-logo-3.png";  //  ui/assets/img
UM.About = "OR-Devs.",

UM.NavUrl = {
        store: "https://trollface.dk",
        discord: "https://discord.gg/yjCmVvC5tE",
}

UM.TemplateColor =  {
        defaultcolor: "#2ec090",
        opacitycolor: "#203b46ba",
};

UM.RandomColor = {
        enabled: false,
        time: 600,
};

UM.DefaultVideo = {
        enabled: false,
        lightId: "bg",
        darkId: "bg2",
}
UM.YoutubeVideo = {
        enabled: true,
        videoId: "lIqZ60pTlV8",
}

UM.Music = {
        musicID: "music.mp3",
        volume: 0.7,
}

UM.RandomBackground = {
        enabled: true, // If you set this to false, will get the first one.
        img: ['bg1.jpg','bg2.png','bg3.jpg'],
}

UM.RandomInfo = {
        enabled: true,
        text: [
                "🎉[1] Hablandome MUUEEEELLLLTOOOO.",
                "🥳[2] Tu no me puede venir con normativa de otro servidore.",
                "🥳[3] Si tu cree que la policia tiene ventaja! pue metete a policia entonce!.",
                "🎉[4] Maldito negro verdad?!.",
                "🥳[5] Ok una pregunta, como a que hora tu me va deja habla?.",
                "🎉[6] me dicen que le dieron una puñalada a richard.",
                "🥳[7] Nooo tu roles aqui se acaban!!.",
          ]
}