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
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .

Turbolinks.enableProgressBar();

// $('.board').hover(function(){
//   $('.board-buttons').show();
// })

function listButton(){
  $('.list-box').on('click', '.card-form-button', function(){
    var form = $(this).closest('.list-box').children('.list-form');

      form.slideToggle()
    if(form.hasClass('hidden-list-form')){
      form.removeClass('hidden-list-form')
      $(this).text('Hide this form')
             .removeClass('hidden-list-form')
             .addClass('big-opacity')
        
    } else {
      form.addClass('hidden-list-form')
      $(this).text('Add Card')
             .addClass('hidden-list-form')
             .removeClass('big-opacity ')
    }
  })
}

function cardButtons(){
  $('.list-box').on('click', '.card-headline', function(){
    $(this).closest('li').find('.card-buttons').slideToggle();
  })
}

$(document).ready(listButton)
$(document).ready(cardButtons)
$(document).on('page:load', listButton)
$(document).on('page:load', cardButtons)
