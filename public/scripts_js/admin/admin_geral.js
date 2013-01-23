$(function(){
    //VALIDAÇÃO DE FORMULÁRIOS
   
    if($("#form").length){
        var aviso_alerta = $("p.aviso_alerta");
        var validator = $("#form").validate({
            onkeyup: false,
            errorContainer: aviso_alerta ,
       
            invalidHandler: function() {
                              
                var errors = validator.numberOfInvalids();                
                if (errors) {
                    var message = errors == 1
                    ? 'Por favor informe corretamente o campo em destaque!'
                    : 'Por favor informe corretamente os ' + errors + ' campos em destaque!';
                    aviso_alerta.html(message);
                    aviso_alerta.show();
                }else{
                    aviso_alerta.hide(); 
                }
            },
            errorPlacement: function(error, element) {
          
                var errors = validator.numberOfInvalids();
                if(errors){
                    var name = $(element).attr("name");
                    $("[for="+name+"]",$("#form")).add("span[for="+name+"]").css({
                        "color": "#FF0000"
                    });
                    
                }
            },
            success: function(error) {
                var name = $(error).prop("for");
                $("[for="+name+"]",$("#form")).add("span[for="+name+"]").attr("style", "");

                var errors = validator.numberOfInvalids();
                if (errors) {
                    aviso_alerta.html("Por favor informe corretamente " + (errors == 1 ? "o campo" : "os "+errors+" campos") + " abaixo").show();
                }else{
                    aviso_alerta.empty().hide();
                }
            }
           
        });
    }
    
    //DIALOGO DE EXCLUSAO
    
    if($("a.excluir").length){
        
        $("a.excluir").click(function(){
                     
            if(confirm("Você têm certeza que deseja excluir estes dados ?")){
                return true;
            }
        
            return false;           
        });
    }
    
});


