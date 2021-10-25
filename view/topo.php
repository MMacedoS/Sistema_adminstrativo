
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sis|Tema Financeiro</title>
    <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> -->
    <link rel="stylesheet" href="<?=ROTA_GERAL?>/view/css/style.css">
    <!-- boxins cdn icones -->
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<link rel="stylesheet" type="text/css" href="<?=ROTA_GERAL?>/view/DataTables/datatables.min.css"/>
    <script type="text/javascript" src="<?=ROTA_GERAL?>/view/DataTables/datatables.min.js"></script>
    
</head>
<body>
  
<div class="sidebar">
    <div class="logo_content">
        <div class="logo">
        <i class='bx bxl-codepen'></i>
            <div class="logo_name">Sistema Financeiro</div>
        </div>
        <i class='bx bx-menu' id="btn"></i>
    </div>
    <ul class="nav_list">
        <!-- <li>
            <a href="#">
            <i class='bx bx-search' ></i>
            <input type="search" placeholder="busca...">
            
            </a>
            <span class="tooltip">busca</span>
        </li> -->
        <li>
            <a href="<?=ROTA_GERAL?>">
            <i class='bx bx-grid-alt' ></i>
            <span class="link_name">
                Painel Principal
            </span>
            </a>
            <span class="tooltip">Dashboard</span>
        </li>
        <li>
            <a href="<?=ROTA_GERAL?>/Bico/listar">
            <i class='bx bxs-gas-pump'></i>
            <span class="link_name">
                Cadastrar Bicos
            </span>
            </a>
            <span class="tooltip">Bicos</span>
        </li>
        <li>
            <a href="">
            <i class='bx bxs-user-check'></i>
            <span class="link_name">
                Funcionarios
            </span>
            </a>
            <span class="tooltip">Funcionarios</span>
        </li>
        <li>
            <a href="">
            <i class='bx bx-pie-chart-alt-2' ></i>
            <span class="link_name">
                Relatorios
            </span>
            </a>
            <span class="tooltip">Relatorios</span>
        </li>
        <li>
            <a href="">
            <i class='bx bxs-time-five' ></i>
            <span class="link_name">
                Horarios
            </span>
            </a>
            <span class="tooltip">Horarios</span>
        </li>
        <li>
            <a href="">
            <i class='bx bx-cart-alt' ></i>
            <span class="link_name">
                Compras
            </span>
            </a>
            <span class="tooltip">Compras</span>
        </li>
        <!-- <li>
            <a href="">
            <i class='bx bx-heart' ></i>
            <span class="link_name">
                Saved
            </span>
            </a>
            <span class="tooltip">Saved</span>
        </li> -->
        <li>
            <a href="">
            <i class='bx bx-cog' ></i>
            <span class="link_name">
                Settings
            </span>
            </a>
            <span class="tooltip">Settings</span>
        </li>        
    </ul>
    <div class="profile_content">
        <div class="profile">
            <div class="profile_details">
                <img src="<?=ROTA_GERAL?>/view/img/user.jpg" alt="user">
                <div class="name_job">
                    <div class="name">Mauricio</div>
                    <div class="job">web Develope</div>
                </div>
            </div>
            <i class="bx bx-log-out" id="log_out"></i>
        </div>
    </div>
</div>
<div class="home_content">
    <div class="text">