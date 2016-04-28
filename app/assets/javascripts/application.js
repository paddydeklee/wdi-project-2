// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require_tree .

$(function(){ $(document).foundation()


  // $("textarea.expand").focus( function () {
  //   console.log(this)
  //     $(this).animate({ height: "4em" }, 500); 
  // });

  var comment = $('.medium-12.columns.comment-right.right')

  comment.css('text-align', 'right')

 }); // End of document.ready










// $(document).foundation({
//   accordion: {
//     toggleable: false
//   }
// });

// function accordionAnimation(accordion){
//   var $this = $(accordion);
//   var $link = $this.find('.accordion-navigation > a');
  
//   $this.find('.content.active').css('width', $this.find('.content.active').children().outerHeight());
  
//   $link.on('click', function(){
//     console.log($this.find('.content.active').attr('id'));
//     if( $(this).attr('href') == '#' + $this.find('.content.active').attr('id') ) {
//       console.log('if');
//       $(this).next().css('width', 0);
//     } else {
//       console.log('else');
//       $this.find('.content.active').css('width', 0);
//       $(this).next().css('width', $(this).next().children().innerHeight());
//     }
    
//   });
// };

// $(document).ready(function() {
//   accordionAnimation($('.accordion.animated'));
// });

