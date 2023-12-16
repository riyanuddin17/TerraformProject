let output = document.getElementById('ip')

function display(x){
    output.value += x;
}

function Calculate(){
    try{
        output.value = eval(output.value)
    }
    catch (err){
        alert("Invalid")
    }
}


function Clear(){
    output.value = "";
}

function backspace(){
    output.value = output.value.slice(0,-1);
}
















// let string = "";
// let buttons = document.querySelectorAll('.calculator');
// Array.from(buttons).forEach((button)=>{
//   button.addEventListener('click', (e)=>{
//     if(e.target.innerHTML == '='){
//       string = eval(string);
//       document.querySelector('input').value = string;
//     }
//     else if(e.target.innerHTML == 'C'){
//       string = ""
//       document.querySelector('input').value = string;
//     }
//     else{ 
//     console.log(e.target)
//     string = string + e.target.innerHTML;
//     document.querySelector('input').value = string;
//       }
//   })
// })