document.addEventListener('turbolinks:load',function(){
var windowHeight=$(window).height();
var visualAreaHeight=$('#visualArea').height();
var visualBlankHeight=windowHeight-visualAreaHeight;
$('#footer').before('<div id="blankArea"></div>');
$('#blankArea').css('height',visualBlankHeight);
});
