addEventListener("message", function(event){
  
    if(event.data.typ == "me"){

            if (event.data.toggle == true) {
                document.getElementById("datame").innerHTML = event.data.html;
                $("#datame").show()
            }else{
                $("#datame").hide()
            }
                    
    }else if(event.data.typ == "do"){
        
            if (event.data.toggle == true) {
                document.getElementById("datado").innerHTML = event.data.html;
                $("#datado").show()
            }else{
                $("#datado").hide()
            }

    }else if(event.data.typ == "dofijo"){
        
           let item = event.data;
           if(item.type == "txt")
           { document.getElementById("datadofijo").innerHTML = item.html; }
    }
});

