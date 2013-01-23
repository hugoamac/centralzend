$(function(){
    
    $(".add").live("click",function(){
        
        var clone = $(this).parent().clone();        
        $("input[type=text]",clone).attr("value","");
        $("input[type=hidden]",clone).remove();
        if(!$("a.del",clone).length)
            clone.append("<a href='javascript:void(0);' class='del'><img src='/images/admin/icon_del.png' title='excluir' class='icon'/></a> ");
        $("#transacao_div").append(clone);
        
    });
    $(".del").live("click",function(){
      
        if(confirm("você tem certeza que deseja excluir este dado?")){
            var p=$(this).parent();  
            var input = $("input[type=text]",p);
            if(p.find('input[type=hidden]').length){
                var id_transacao = p.find('input[type=hidden]').attr('value');                
                $.ajax({
                    url:'/admin/recurso/excluitransacao',
                    type:'post',
                    data:{
                        'id':id_transacao
                    },
                    dataType:'json',
                    success:function(data){                    
                        if(data.status == 1)
                            p.fadeIn().remove();
                        else if(data.status ==2){
                            if(input.val()=="")
                                p.fadeIn().remove();
                            else
                                alert(data.msg);
                        }
                    }                                
                });
            }else{                
                p.fadeIn().remove(); 
            }
        }  
    });     
});

