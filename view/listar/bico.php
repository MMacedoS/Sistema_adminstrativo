<?php require_once PATH_GERAL.'/view/topo.php';?>
<link rel="stylesheet" href="<?=ROTA_GERAL?>/view/css/table.css">
<link rel="stylesheet" href="<?=ROTA_GERAL?>/view/css/modal.css">
Listas de Bicos Cadastrados 


<div class="lista">
    <button id="myBtn" class="myButton">Adiconar Bico</button>
    <div class="table-responsive">
    <table id="example" class="blueTable">
     <thead>
            <tr>
                <th>First Name</th>
                <th>head2</th>
                <th>head3</th>
                <th>head4</th>
            </tr>
        </thead>
        <tbody>
            <?php for($a=1;$a<=100;$a++){?>
                <tr>
                    <td>cell1_<?=$a?></td>
                    <td>cell2_<?=$a?></td>
                    <td>cell3_<?=$a?></td>
                    <td>cell4_<?=$a?></td>
                </tr>
            <?php }?>  
        </tbody>
        </tr>
    </table>
    </div>
</div>


<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
    <p>Cadastro de Bico</p>
    <div class="modal-body">
        <form action="">
            <fieldset>
                <div class="form-row">
                    <div class="inputform">
                        <label for="">Numero do Bico</label>
                        <input type="text" name="" id="">
                    </div>
                    <div class="inputform">
                        <label for="">Produto</label>
                        <input type="text" name="" id="">
                    </div>
                </div>
            </fieldset>
            <fieldset>
                <div class="form-row">
                    <div class="inputform">
                        <label for="">Quantidade</label>
                        <input type="text" name="" id="">
                    </div>
                    <div class="inputform">
                        <label for="">Status</label>
                        <input type="text" name="" id="">
                    </div>
                </div>
            </fieldset>
               
        </form>
    </div>
    <hr>
    <div class="modal-footer">
             <div class="form-row right">
                <button id="myBtn" class="myButton success">Adicionar Bico</button>
                <button id="myBtn" class="myButton cancelar">Cancelar</button>
             </div>
    </div>
  </div>

</div>


<?php require_once PATH_GERAL.'/view/rodape.php';?>
