<%-- 
    Document   : Footer
    Created on : 18 jun. 2024, 4:41:21 p. m.
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>



<footer>
   <!-- footer section start -->
   <div class="footer_section layout_padding">
      <div class="container">
         <div class="row">
            <div class="col-lg-3 col-sm-6">
               <div class="footer_logo"><a href="index.html"><img src="images/logo.png"></a></div>
               <h1 class="adderss_text">Contáctenos</h1>
               <div class="map_icon"><img src="images/map-icon.png"><span class="paddlin_left_0">Ubicanos</span></div>
               <div class="map_icon"><img src="images/call-icon.png"><span class="paddlin_left_0">+7586656566</span></div>
               <div class="map_icon"><img src="images/mail-icon.png"><span class="paddlin_left_0">volim@gmail.com</span></div>
            </div>
            <div class="col-lg-3 col-sm-6">
               <h1 class="adderss_text">Nuestros Médicos</h1>
               <div class="hiphop_text_1">Conozca a nuestros médicos altamente calificados y comprometidos con su salud y bienestar.</div>
            </div>
            <div class="col-lg-3 col-sm-6">
               <h1 class="adderss_text">Enlaces Útiles</h1>
               <div class="Useful_text">
                  <ul>
                     <li><a href="#">Servicios</a></li>
                     <li><a href="#">Citas</a></li>
                  </ul>
               </div>
            </div>
            <div class="col-lg-3 col-sm-6">
               <h1 class="adderss_text">Boletín Informativo</h1>
               <input type="text" class="Enter_text" placeholder="Enter your Emil" name="Enter your Emil">
               <div class="subscribe_bt"><a href="#">Suscribirse</a></div>
               <div class="social_icon">
                  <ul>
                     <li><a href="#"><img src="images/fb-icon.png"></a></li>
                     <li><a href="#"><img src="images/twitter-icon.png"></a></li>
                     <li><a href="#"><img src="images/linkedin-icon.png"></a></li>
                     <li><a href="#"><img src="images/instagram-icon.png"></a></li>
                  </ul>
               </div>
            </div>
         </div>
      </div>
   </div>
   <!-- footer section end -->
   <!-- copyright section start -->
   <div class="copyright_section">
      <div class="container">
         <p class="copyright_text">2024 Todos los derechos reservados. Diseñado por <a href="https://html.design">GRUPO - UTP</a></p>
      </div>
   </div>
</footer>
<style>
    
    .footer_section {
    width: 100%;
    float: left;
    background-color: #252525;
    height: auto;
    padding-bottom: 50px;
    box-shadow: 0px 24px 19px -1px #222223;
    position: relative;
}

  .layout_padding {
    padding-top: 90px;
    padding-bottom: 0px;
}  

.map_icon {
    width: 100%;
    float: left;
    font-size: 16px;
    color: #d6d6d6;
    padding-bottom: 10px;
}
.adderss_text {
    width: 100%;
    float: left;
    font-size: 24px;
    color: #ffffff;
    padding-bottom: 30px;
}
.footer_logo {
    width: 80%;
    float: left;
    padding: 0px 0px 30px 0px;
}
 .hiphop_text_1 {
    width: 90%;
    color: #d6d6d6;
    font-size: 16px;
    margin-left: 0px;
}   
.Useful_text {
    width: 50%;
    color: #d6d6d6;
    font-size: 16px;
    margin-left: 0px;
}
.subscribe_bt {
    width: 170px;
    float: left;
    margin-top: 20px;
}

.subscribe_bt a {
    width: 100%;
    float: left;
    font-size: 18px;
    color: #ffffff;
    background-color: #19e9d9;
    text-align: center;
    padding: 7px 0px;
    text-transform: uppercase;
}

.social_icon {
    width: 100%;
    float: left;
}

.social_icon ul {
    margin: 0px;
    padding: 0px;
}

.social_icon li {
    float: left;
    padding-right: 10px;
    padding-top: 20px;
}
.copyright_section {
    width: 100%;
    float: left;
    background-color: #252525;
    height: auto;
}
.copyright_text {
    width: 100%;
    float: left;
    font-size: 16px;
    margin-left: 0px;
    color: #fff;
    text-align: center;
}

.copyright_text a {
    color: #ffffff;
}

.copyright_text a:hover {
    color: #19e9d9;
}

.Enter_text {
    width: 100%;
    float: left;
    font-size: 18px;
    color: #ffffff;
    background-color: transparent;
    padding: 7px 10px;
    margin-top: 10px;
    border: 1px solid #cfcfd0;
}

input.Enter_text::placeholder {
    color: #fff;
}

</style>
