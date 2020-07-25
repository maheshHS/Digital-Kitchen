var item_add = document.querySelector('.add_item_click');
var modal_add = document.querySelector('.add_modal');
var modal_cancel = document.querySelector('.modal_cancel');



item_add.addEventListener('click',function(){
  modal_add.classList.add('modal_active');
});


modal_cancel.addEventListener('click',function(){
  modal_add.classList.remove('modal_active');
})

