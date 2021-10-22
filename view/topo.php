
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
        <li>
            <a href="#">
            <i class='bx bx-search' ></i>
            <input type="search" placeholder="search...">
            
            </a>
            <span class="tooltip">search</span>
        </li>
        <li>
            <a href="">
            <i class='bx bx-grid-alt' ></i>
            <span class="link_name">
                Dashboard
            </span>
            </a>
            <span class="tooltip">Dashboard</span>
        </li>
        <li>
            <a href="">
            <i class='bx bx-user' ></i>
            <span class="link_name">
                User
            </span>
            </a>
            <span class="tooltip">User</span>
        </li>
        <li>
            <a href="">
            <i class='bx bx-chat' ></i>
            <span class="link_name">
                Messages
            </span>
            </a>
            <span class="tooltip">Messages</span>
        </li>
        <li>
            <a href="">
            <i class='bx bx-pie-chart-alt-2' ></i>
            <span class="link_name">
                Analytics
            </span>
            </a>
            <span class="tooltip">Analytics</span>
        </li>
        <li>
            <a href="">
            <i class='bx bx-folder' ></i>
            <span class="link_name">
                File Manager
            </span>
            </a>
            <span class="tooltip">File Manager</span>
        </li>
        <li>
            <a href="">
            <i class='bx bx-cart-alt' ></i>
            <span class="link_name">
                Order
            </span>
            </a>
            <span class="tooltip">Order</span>
        </li>
        <li>
            <a href="">
            <i class='bx bx-heart' ></i>
            <span class="link_name">
                Saved
            </span>
            </a>
            <span class="tooltip">Saved</span>
        </li>
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