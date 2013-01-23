
$(function(){
    
    $(".add").live("click",function(){
        
        var clone = $(this).parent().clone();        
        $("input",clone).attr("value","");
        if(!$("a.del",clone).length)
            clone.append("<a href='javascript:void(0);' class='del'><img src='/images/admin/icon_del.png' title='excluir' class='icon'/></a> ");
        $("#transacao_div").append(clone);
        
    });
    $(".del").live("click",function(){
       
        $(this).parent().fadeIn().remove();      
  
    });  
    
    
});
