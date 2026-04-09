/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
function formValidation1()
{
    var name=document.sign.t1;
    var gender=document.sign.t2;
    var dob=document.sign.demo1;
    var addr=document.sign.t3;
    var pin=document.sign.t4;
    var phone=document.sign.t5;
    var email=document.sign.t6;
   if(name.value=="")
       {
         alert("User Name required");
         return false;
       }
       else
       {
          if(t1_val(name))
          {
                  
          }
       }
}
function formValidation2()
{
    var name=document.sign.t1;
    var gender=document.sign.t2;
    var dob=document.sign.demo1;
    var addr=document.sign.t3;
    var pin=document.sign.t4;
    var phone=document.sign.t5;
    var email=document.sign.t6;
   if(name.value=="" || gender.value=="" || dob.value=="")
       {
         alert("Previous fields can't be null");
         return false;
       }
       else
       {
          if(t1_val(name))
          {
              if(t2_val(gender))
          {
                  
          }    
          }
       }
}
function formValidation3()
{
    var name=document.sign.t1;
    var gender=document.sign.t2;
    var dob=document.sign.demo1;
    var addr=document.sign.t3;
    var pin=document.sign.t4;
    var phone=document.sign.t5;
    var email=document.sign.t6;
   if(name.value=="" || gender.value=="" || dob.value==""|| addr.value=="")
       {
         alert("Previous fields can't be null");
         return false;
       }
       else
       {
          if(t1_val(name))
          {
              if(t2_val(gender))
          {
               if(t3_val(addr))
          {
                  
          }       
          }    
          }
       }
}
function formValidation4()
{
    var name=document.sign.t1;
    var gender=document.sign.t2;
    var dob=document.sign.demo1;
    var addr=document.sign.t3;
    var pin=document.sign.t4;
    var phone=document.sign.t5;
    var email=document.sign.t6;
   if(name.value=="" || gender.value=="" || dob.value==""|| addr.value=="" || pin.value=="")
       {
         alert("Previous fields can't be null");
         return false;
       }
       else
       {
          if(t1_val(name))
          {
              if(t2_val(gender))
          {
               if(t3_val(addr))
          {
                   if(t4_val(pin))
          {
                  
          }    
          }       
          }    
          }
       }
}
function formValidation5()
{
    var name=document.sign.t1;
    var gender=document.sign.t2;
    var dob=document.sign.demo1;
    var addr=document.sign.t3;
    var pin=document.sign.t4;
    var phone=document.sign.t5;
    var email=document.sign.t6;
   if(name.value=="" || gender.value=="" || dob.value==""|| addr.value=="" || pin.value=="" || phone.value=="")
       {
         alert("Previous fields can't be null");
         return false;
       }
       else
       {
          if(t1_val(name))
          {
              if(t2_val(gender))
          {
               if(t3_val(addr))
          {
                   if(t4_val(pin))
          {
                  if(t5_val(phone))
          {
                  
          }    
          }    
          }       
          }    
          }
       }
}
function t1_val(name)
{
 
    if(name.value=="")
        {
alert("User Name required");
name.focus();
return false;
        }
            return true;  
}
function t2_val(gender)
{
 
    if(gender.value=="")
        {
alert("Gender required");
gender.focus();
return false;
        }
            return true;  
}
function t3_val(addr)
{
 
    if(addr.value=="")
        {
alert("Address required");
addr.focus();
return false;
        }
            return true;  
}
function t4_val(pin)
{
   var numbers = /^[0-9]+$/;
if(pin.value.match(numbers) && pin.value.length==6)
{
return true;
}
else
{
alert('Pin code must have 6 numeric characters only');
pin.focus();
return false;
}
}
function t5_val(phone)
{
   var numbers = /^[0-9]+$/;
if(phone.value.match(numbers) && phone.value.length==10)
{
return true;
}
else
{
alert('Enter Valid Phone No');
phone.focus();
return false;
}
}