<?php require_once 'topo.php';?>
       <div class="text">
       Dados iniciais dos Bicos
       </div>
       
        <link rel="stylesheet" href="<?=ROTA_GERAL?>/view/css/home.css">

        <div class="cards">

        <?php   foreach($this->bicos as $key=>$value){?>
            <div class="card">
                <div class="card_title <?=$value['cor']?>"><i class='bx bxs-gas-pump'></i><?=$value['descricao']?></div>
                <div class="card_body">
                    <?=$value['fechamento']?>
                </div>

            </div>
        <?php }?>

        </div>
    <hr>
    <div class="text">
        Painel 
    </div>
<?php require_once 'rodape.php';?>