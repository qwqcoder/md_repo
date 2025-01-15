1. 选择器

   ```html
   <script>
       $(".div") //类选择器
       $("#div") //id选择器
       $("div")  //标签选择器
   </script>
   ```

2. jQuery脚本

   ```html
   <html>
       <head>
       <title>Title</title>
       <script src="js/jquery.min.js"></script>
   </head>
   <body>
       <form>
           <label for="name">name:</label><input name="name" id="name" type="text">
           <input type="button" name="button" id="checkName">
           <label for="age">age:</label><input name="age" id="age" type="text">
       </form>
   </body>
   
   // ------------------   jquery   ----------------------------
   <script>
       $(document).ready(function () {
           $("#checkName").click(function () {
               if ($("#name").val() === "") {
                   alert("请输入name");
                   $("name").focus();
               } else {
                   $.post("checkName.jsp", {name: $("#name").val()}, function (data) {
                       console.log(data);
                   }, "xml");
               }
           })
       })
   </script>
   </html>
   ```

   `$(document).read(function(){})`定义的是当`html`全部加载完成后,执行`function`函数
   
3. 
