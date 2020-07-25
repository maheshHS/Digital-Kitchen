// var item_edit = document.querySelector('.icon_edit');
// var modal_add = document.querySelector('.add_modal');
// var modal_cancel = document.querySelector('.modal_cancel');


// item_edit.addEventListener('click',function(){
//   modal_add.classList.add('modal_active');
// });

// modal_cancel.addEventListener('click',function(){
//     modal_add.classList.remove('modal_active');
// });

$('.edit_item_btn').click(function(event){
  console.log(this);
  $("#update_item_" + this.id).addClass('modal_active');
  event.preventDefault();
});

$(".update_cancel_item").click(function(evt){
  console.log('test');
});

