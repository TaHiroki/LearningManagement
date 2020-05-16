$(document).on('turbolinks:load',function(){

  $('.box').click(function(){
    var x = "#" + this.id
    $(x).css('background-color', 'green');
  });
});