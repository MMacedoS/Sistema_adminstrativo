</div>
</div>

<script>
    let btn = document.querySelector("#btn");
    let sidebar = document.querySelector(".sidebar");
    let searchbtn = document.querySelector(".bx-search");

    btn.onclick=function(){
        sidebar.classList.toggle("active");
    }
    // searchbtn.onclick=function(){
    //     sidebar.classList.toggle("active");
    // }
</script>

<script src="<?=ROTA_GERAL?>/view/js/ajax.js"></script>
<script src="<?=ROTA_GERAL?>/view/js/modal.js"></script>


</body>
</html>