<%
dim id_newsPromo 
dim tipologia

id_newsPromo = request.QueryString("id_newsPromo")
tipologia = request.QueryString("tipologia")

dim connessione
connessione = "DRIVER={MySQL ODBC 3.51 Driver};Server=62.149.150.101;Database=Sql280123_3;Uid=Sql280123;Pwd=b73e5b12"


dim rs
Set rs = Server.CreateObject("ADODB.Recordset")
Dim conn 
Set conn = Server.CreateObject("ADODB.Connection") 
conn.Open connessione

dim sqlNewsPromo
sqlNewsPromo = "SELECT F.*, A.id, A.coordinate, A.ragione_sociale, A.indirizzo, A.num, A.cap, A.paese, A.provincia, A.tel, A.mail, A.web FROM app_attivita as A, app_foto as F WHERE F.id_attivita = A.id AND F.tipologia='" & tipologia & "' AND F.id=" & id_newsPromo

rs.Open sqlNewsPromo, conn
%>

<html>
<head>
	
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    
    
    
    <link rel="stylesheet" href="../css/jquery.mobile-1.4.5.min.css">
    <link rel="stylesheet" href="../css/default_theme.min.css">
    <link rel="stylesheet" href="../css/jquery.mobile.icons.min.css">
    <link rel="stylesheet" href="../css/style.css">
    <script src="../js/jquery-1.11.2.min.js"></script>
    <script src="../js/jquery.mobile-1.4.5.min.js"></script>
    <script src='https://maps.googleapis.com/maps/api/js?v=3.exp'></script>
    <script src="../js/standard.js"></script>
    
 	<%  
	if not rs.EOF then
	%>
		<meta property='og:title' content='<%=rs.Fields("titolo")%>'>
        <meta property='og:description' content='<%=rs.Fields("descrizione")%>'>
        <meta property='og:type' content='article'>
        <meta property='og:locale' content='it_IT'>				       
        <meta property='og:image' content=''>
    <%
	else %>
    	<meta property='og:title' content='Trovo x Te'>
		<meta property='og:description' content='Il portale creato apposta per te,
per trovare in mondo facile e veloce quello che ti serve nel tuo territorio.'>
        <meta property='og:type' content='article'>
        <meta property='og:locale' content='it_IT'>				       
        <meta property='og:image' content='http://www.trovoperte.com/images/logo_trovoperte.png'>
	
    <%end if
	
	rs.Close
	conn.Close
	set rs=nothing
	set conn=nothing
	
	%>
    
    
</head>
<body>
    <div class="txtwrapper">
        <!-- dettaglio newsPromo -->
        <div data-role="page" id="page_dettaglio_newsPromo">
            <!-- pannello laterale -->
            <div data-role="panel" id="myPanel" data-display="overlay" data-position="right">
                <div class="ui-btn-right">
                    <a href="#myPanel" class="ui-btn sideOption ui-btn-inline ui-btn-icon-left ui-icon-grid"
                        data-role="button" data-icon="grid">&nbsp;</a>
                </div>
                <br>
                <br>
                <br>
                <a href="../index.html" class="btn_search ui-btn sideOption ui-btn-inline ui-icon-home ui-btn-icon-left"
                    data-role="button" data-icon="home" data-ajax="false">Home</a> <a href="ricerca.html"
                        class="btn_search ui-btn sideOption ui-btn-inline ui-icon-search ui-btn-icon-left"
                        data-role="button" data-icon="search" data-ajax="false">Cerca</a> 
                         <a href='#allIndustry_mapPage' data-icon='location' data-rel='popup'
                    data-position-to='window' data-transition='pop' class='btn_search sideOption ui-btn  ui-btn-inline ui-icon-location ui-btn-icon-left'>
                    Mappa aziende</a>
                        <a href='#settings' data-icon='gear' data-rel='popup' data-position-to='window' data-transition='pop'
                            class='btn_search ui-btn sideOption ui-btn-inline ui-icon-gear ui-btn-icon-left'>
                            Impostazioni</a>
                <!-- setting -->
                <div id="settings" data-role="popup">
                    <div data-role="header">
                        <a href="#" data-iconpos="notext" data-mini="true" class="ui-btn ui-corner-all sideOption ui-btn-inline ui-btn-b ui-icon-delete ui-mini ui-btn-icon-notext ui-btn-right"
                            data-rel="back" data-icon="delete">&nbsp;</a>
                        <h1>
                            Impostazioni</h1>
                    </div>
                    <div data-role="content">
                        <ul data-role="listview" style="margin: 0 !important">
                            <li><a href="#" class="small">Testo piccolo</a></li>
                            <li><a href="#" class="med">Testo medio</a></li>
                            <li><a href="#" class="large">Testo grande</a></li>
                        </ul>
                    </div>
                </div>
                <a href='#page_info' data-icon='info' data-rel='popup' data-position-to='window'
                    data-transition='pop' class='btn_search ui-btn sideOption ui-btn-inline ui-icon-info ui-btn-icon-left'>
                    Info generali</a>
                <!--<a href='#page_richiestaInfo' data-icon='mail' data-rel='popup' data-position-to='window'
                    data-transition='pop' class='btn_search sideOption ui-btn  ui-btn-inline ui-icon-mail ui-btn-icon-left'>
                    Contattaci</a>-->
                 <a href='#page_registrazione' data-icon='plus' data-rel='popup' data-position-to='window'
                    data-transition='pop' class='btn_search sideOption ui-btn  ui-btn-inline ui-icon-plus ui-btn-icon-left'>
                    Richiesta iscrizione</a>
                   <a href="#" onClick="prepara_link_areariservata(this)" class="btn_search sideOption ui-btn  ui-btn-inline ui-icon-lock ui-btn-icon-left" data-role="button" data-icon="lock" data-ajax="false">Area riservata</a>
                <!-- info -->
                                     <div data-role="popup" id="page_info">
              <div data-role="header">
              	 <a href="#" data-iconpos="notext" data-mini="true" class="ui-btn ui-corner-all ui-shadow ui-btn-inline ui-btn-b ui-icon-delete ui-mini ui-btn-icon-notext ui-btn-right" data-rel="back" data-icon="delete">&nbsp;</a>
                <h1>Info generali</h1>
              </div>
            
              <div data-role="main" class="ui-content">
              	Trovo per Te è il portale ed la App creati proprio per Te, per trovare in modo semplice e veloce quello che ti serve nel tuo territorio.<br><br>

<b>Sei un privato?</b><br><br>

Potrai scaricare in modo gratuito e senza pubblicità la App su tuo smarthphone o tablet, oppure consultare il portale dedicato sul web.<br><br />

Avrai così la possibilità di trovare velocemente locali, aziende e professionisti in base alle tue necessità e approfittare di promo e offerte che verranno pubblicate. <br><br />

Potrai contattarli direttamente, mandargli una mail o raggiungerli seguendo il navigatore.<br> <br><br>

<b>Hai la partita IVA?</b><br><br>
Ideale per estendere la tua visibilità sui dispositivi mobili a basso costo e in assoluta autonomia con la gestione dei contenuti. <br><br />
Tramite un semplice pannello di controllo potrai gestire descrizioni, servizi, news, promo, offerte ogni volta che vorrai. <br><br />
Tutti potranno interagire tramite i tasti funzionali della tua scheda azienda: telefono, mail, navigatore, social, ecc.. <br><br />
Quattro fasce di prezzo annuali in base alle vostre necessità: 30€, 80€, 120€, 150€ iva esclusa.<br /><br />
<b>Richiedi l'iscrizione cliccando <a onClick="apriRegistrazione()" href='#page_registrazione' data-rel='popup'
                        data-position-to='window' data-transition='pop'>qui</a></b><br/><br />
Oppure <br /><br />

<b>Contattaci per avere maggiori informazioni cliccando <a onClick="apriInfo()" href='#page_richiestaInfo' data-rel='popup'
                        data-position-to='window' data-transition='pop'>
                        qui</a></b>



              </div>
                


              
            </div>
                 <!-- richiesta informazioni -->
                <div data-role="popup" id="page_richiestaInfo" style="width: 35%; margin: 0 auto;">
                        
                <div data-role="header">
                    <a href="#" data-iconpos="notext" data-mini="true" class="ui-btn ui-corner-all ui-shadow ui-btn-inline ui-btn-b ui-icon-delete ui-mini ui-btn-icon-notext ui-btn-right"
                        data-rel="back" data-icon="delete">&nbsp;</a>
                    <h1>
                        Contattaci</h1>
                </div>
                <form  method="post"  onsubmit="return validateFormInfo();" action="../formcdosys_generale.asp" id="form_richiestaInfo" name="form_richiestaInfo"><input type="hidden" name="tipologia" value="Richiesta informazioni">
                     <div class="form_left">
                            <input  name="nome" id="txtNomeInfo" type="text" placeholder="Nome" class="required"/>
                        </div >
                        <div class="form_right">
                            <input name="cognome" id="txtCognomeInfo" type="text" placeholder="Cognome" class="required"/>
                        </div >
                        <div class="emailInfo">
                            <input id="txtMailInfo" name="email" type="text" placeholder="E-mail" class="required"/>
                        </div>                    
                        
                    <div class="textAreaInfo">
                        <textarea id="richiesta" placeholder="Richiesta" name="richiesta" rows="6" class="required"></textarea>
                   </div>
                    <p style="height: 75px; overflow: auto; clear:both; display:inline-block; margin-top:20px; margin-bottom:30px; padding:0 10px 0 10px">
                        Acconsento al trattamento dei miei dati da parte di "MVItalia" ( per finalita'
                        commerciali, promozionali e statistiche, nonche' per l'invio di omaggi e/o materiale
                        informativo su nuovi prodotti e iniziative promozionali. I suoi dati potranno essere
                        trattati da "MVItalia", direttamente o tramite societa' preposte. Prenderemo
                        tutte le cautele necessarie affinche' i suoi dati siano trattati con la massima
                        sicurezza e in conformita' a quanto previsto in materia di tutela dei dati personali.Dlgs
                        196/2003INFORMATIVA AI SENSI DEL DLGS 196/2003 FINALITA' E MODALITA' DEL TRATTAMENTO
                        DEI DATI PERSONALI</p>
                    <br />
                    
                        
                        <div style="padding: 0 10px 0 10px;"><input type="checkbox" class="required" name="conferma" id="chkConferma_info" />
                        <label style="text-indent:35px;" id="txtAcconsentoInfo">
                            Acconsento il trattamento dei dati personali</label></div>
                            <div style="clear:both;" id="btnInvioInfo">
                                 <input type="submit" id="Invia_Info" value="Invia Richiesta" name="invia" />
                           </div>
                        </form>
                </div>
        
                <!-- registrazione azienda -->
                <div data-role="popup" id="page_registrazione" style="width: 35%; margin: 0 auto;">
                	<div data-role="header">
                        <a href="#" data-iconpos="notext" data-mini="true" class="ui-btn ui-corner-all ui-shadow ui-btn-inline ui-btn-b ui-icon-delete ui-mini ui-btn-icon-notext ui-btn-right"
                            data-rel="back" data-icon="delete">&nbsp;</a>
                        <h1>
                            Richiesta iscrizione</h1>
                    </div>
                   <form  method="post"  onsubmit="return validateFormRegistrazione();" action="../formcdosys_generale.asp" id="form_registrazioneAzienda" name="form_registrazioneAzienda" ><input type="hidden" name="tipologia" value="Richiesta registrazione">
                    
                        <div class="form_left">
                            <input  name="nome" id="txtNomeRegistrazione" type="text" placeholder="Nome" class="required"/>
                        </div >
                        <div class="form_right">
                            <input name="cognome" id="txtCognomeRegistrazione" type="text" placeholder="Cognome" class="required"/>
                        </div >
                        <div class="form_left">
                            <input id="txtMailRegistrazione" name="email" type="text" placeholder="E-mail" class="required"/>
                        </div>
                       <div class="form_right">
                            <input id="txtTelRegistrazione" name="telefono" type="text" placeholder="Telefono" class="required"/>
                        </div>
                        <div class="form_left">
                            <input id="txtRagioneSociale" type="text" name="r_soc" placeholder="Ragione sociale" class="required"/>
                        </div>
                            <div class="form_right"> <input id="txtPIVA" type="text" name="piva" placeholder="P.IVA" class="required"/></div>
                        <div class="form_left"><input  name="cod_fisc" id="txtCodiceFiscale" type="text" placeholder="Codice fiscale" class="required"/></div>
                            <div class="form_right"><input id="txtIndirizzo" type="text" name="indirizzo" placeholder="Indirizzo" class="required"/></div>
                        <div class="form_left"><input id="txtCAP" type="text" name="cap" placeholder="CAP" class="required"/></div>
                        <div class="form_right"><input id="txtCitta"  type="text" name="citta" placeholder="Città"class="required"/></div>
                        <p style="height: 75px; overflow: auto; clear:both; display:inline-block; margin-top:20px; margin-bottom:30px; padding: 0 10px 0 10px;">
                            Acconsento al trattamento dei miei dati da parte di "MVItalia" ( per finalita'
                            commerciali, promozionali e statistiche, nonche' per l'invio di omaggi e/o materiale
                            informativo su nuovi prodotti e iniziative promozionali. I suoi dati potranno essere
                            trattati da "MVItalia", direttamente o tramite societa' preposte. Prenderemo
                            tutte le cautele necessarie affinche' i suoi dati siano trattati con la massima
                            sicurezza e in conformita' a quanto previsto in materia di tutela dei dati personali.Dlgs
                            196/2003INFORMATIVA AI SENSI DEL DLGS 196/2003 FINALITA' E MODALITA' DEL TRATTAMENTO
                            DEI DATI PERSONALI</p>
                        <br />
                        
                        
                       <div style="padding:0 10px 0 10px;"> <input type="checkbox"  name="conferma" class="required" id="chkConferma_Richiesta" />
                        <label style="text-indent:35px;" id="txtAcconsento">
                            Acconsento il trattamento dei dati personali</label></div>
                            <div style="clear:both;" id="btnInvioRegistrazione">
                                 <input type="submit" id="Invia_Registrazione" value="Invia Richiesta" name="invia" />
                           </div>
                    </form>
                </div>
                 <!-- mappa con tutte  le ditte -->  
        <div data-role="popup" id="allIndustry_mapPage" data-url="map-page" >
              <div data-role="header">
                    <a href="#" data-iconpos="notext" data-mini="true" class="ui-btn ui-corner-all ui-shadow ui-btn-inline ui-btn-b ui-icon-delete ui-mini ui-btn-icon-notext ui-btn-right"
                        data-rel="back" data-icon="delete">&nbsp;</a>
                    <h1>
                        Mappa aziende</h1>
                </div>
             <div role="main" class="ui-content" id="allIndustry_mapCanvas">          
            </div>
              
        </div>

            </div>
            <!-- fine pannello laterale -->
            <div data-role="header" data-position="fixed">
                <a href="#" data-rel="back" data-icon="back" data-position="inline" class="ui-btn-left">
                    &nbsp;</a> <a href="../index.html" data-role="none" class="link_index" data-ajax="false">
                        <img src="../img/logo_trovoperte.png" class="logo_trovo"></a>
                <div class="ui-btn-right">
                    <a href="#myPanel" class="ui-btn ui-shadow ui-btn-inline ui-btn-icon-left ui-icon-grid"
                        data-role="button" data-icon="grid">&nbsp;</a>
                </div>
            </div>
            <div role="main" class="ui-content">
                <div data-role="content" class="ui-content" role="main">
                    <div id="scheda_newsPromo" data-divider-theme="a" data-inset="true">
                        <span class="testo_finto">testo finto</span>
                    </div>
                </div>
            </div>
            <div data-role="footer" data-position="fixed">
                <div data-role="navbar" class="ui-navbar">
                    <ul id="footer_dettaglio" class="ui-grid-c">
                        <li><span class="testo_finto">testo finto</span></li>
                    </ul>
                </div>
            </div>
        </div>
        <!--page-->
    </div>
    <script>

        $("#page_dettaglio_newsPromo").on("pageshow", function (event) {
            var id_newsPromo = getParameterByName("id_newsPromo");
            var tipologia_newsPromo = getParameterByName("tipologia");
            var elencoMarker = new Array();

            $.getJSON("http://www.trovoperte.com/admin/get_json_data.asp", function (info_allIndustry) {

                $.each(info_allIndustry, function (i, name) {
                    if (name.coordinate != "") {
                        var azienda = {};
                        azienda.id = name.id;
                        azienda.nome = name.ragione_sociale;
                        azienda.lat = parseFloat(name.coordinate.split(",")[0]);
                        azienda.lon = parseFloat(name.coordinate.split(",")[1]);
                        elencoMarker.push(azienda);
                    }
                });
                caricaAllIndustry(elencoMarker);

            });


            var scheda = "";
            var footer_dettaglio = "";
			var id_newsPromo = getParameterByName("id_newsPromo");
            var tipologia_newsPromo = getParameterByName("tipologia");
			
            $.getJSON("http://www.trovoperte.com/admin/get_json_data_newsPromo.asp?id_newsPromo=" + id_newsPromo + "&tipologia=" + tipologia_newsPromo, function (info_dettaglio) {


                $.each(info_dettaglio, function (i, name) {

					var meta = "<meta property='og:title' content='"+ name.titolo_newsPromo +"'>";
					if(name.descrizione_newsPromo != "") 
						meta += "<meta property='og:description' content='"+ name.descrizione_newsPromo +"'>";
					meta += "<meta property='og:type' content='article'>";
					meta += "<meta property='og:locale' content='it_IT'>";					
					//meta += "<meta property='og:url' content='www.trovoperte.com/app/page/dettaglio_newsPromo.html?tipologia="+ tipologia_newsPromo + "&id_newsPromo="+id_newsPromo +"'>";
					meta += "<meta property='og:image' content='http://www.trovoperte.com/public/upload_gallery/immagini/"+ name.icona_newsPromo + "'>";
					
					$("head").append(meta);
                    //add the <li> to "li" variable
                    //note the use of += in the variable
                    //meaning I'm adding to the existing data. not replacing it.
                    //store index value in array as id of the <a> tag
                    if (name.id_newsPromo == id_newsPromo) {
						window.titolo = name.titolo_newsPromo;
						window.immagine = name.icona_newsPromo;
						window.ragione_sociale = name.ragione_sociale;
                        //variabile di appoggio dove salvo da data perché il campo del DB è composto da data+ora, e in questo caso serve solo l'ora
                        var data = name.data_newsPromo.split(" ")[0];

                        scheda = scheda + "<div class='info_newsPromo'>";
                        scheda = scheda + "<h1>" + name.titolo_newsPromo + "</h1>";
                        if (name.icona_newsPromo != '') {
                            scheda += "<img src='http://www.trovoperte.com/public/upload_gallery/immagini/" + name.icona_newsPromo + "'>";
                        }
                        scheda = scheda + "<p id='descrizione_newsPromo'>" + name.descrizione_newsPromo + "</p></div></div></div>"
						
						
                        footer_dettaglio += "<div   class='info_azienda'><div class='ui-content'><p>Pubblicato da " + name.ragione_sociale + "</p><p>Inserito il: " + data + "</p>"; // RAGIONE SOCIALE
                        /*footer_dettaglio += "<p><a id=navigatore href='http://maps.google.com/maps?&daddr=" + name.coordinate + "' data-icon='navigation' class=' btn-tel-dettagli ui-btn ui-state-persist ui-btn-up-a ui-btn-inline ui-icon-navigation ui-btn-icon-left'>" + name.indirizzo + " " + name.num + " " + name.cap + " " + name.paese + " " + name.provincia + "</a></p>"; // INDIRIZZO
                        footer_dettaglio += "<p><a href='tel:" + name.tel + "' data-icon='phone' class=' btn-tel-dettagli ui-btn ui-state-persist ui-btn-up-a ui-btn-inline ui-icon-phone ui-btn-icon-left'>" + name.tel + "</a></p>"; // TELEFONO
                        footer_dettaglio += "<p><a href='mailto:" + name.mail + "' data-icon='mail' class='btn-tel-dettagli ui-btn ui-state-persist ui-btn-up-a ui-btn-inline ui-icon-mail ui-btn-icon-left'>" + name.mail + "</a></p>"; // MAIL
                        footer_dettaglio += "<p><a href='http://" + name.web + "' data-icon'=heart' class='btn-tel-dettagli ui-btn ui-state-persist ui-btn-up-a ui-btn-inline ui-icon-heart ui-btn-icon-left'>" + name.web + "</a></p></div>"; // WEB
                        
						*/
						
						/*web only*/
						//footer_dettaglio += "<div style='text-align:center'><span class='st_sharethis_large' displayText='ShareThis'></span><span class='st_facebook_large' displayText='Facebook'></span><span class='st_twitter_large' displayText='Tweet'></span><span class='st_linkedin_large' displayText='LinkedIn'></span><span class='st_googleplus_large' displayText='Google +'></span><span class='st__large' displayText=''></span></div><br>";
						footer_dettaglio += "<div style='text-align:center'><button class='ui-btn ui-corner-all ui-shadow ui-btn-inline ui-btn-b ui-mini' onclick='condividi()'>Condividi</button></div><br>";
						
						footer_dettaglio += "<p id='azienda_link'><a href='dettaglio.html?id_azienda=" + name.id_attivita + "' data-ajax='false' data-icon='arrow-r' class='btn-tel-dettagli ui-btn ui-state-persist ui-btn-up-a ui-btn-inline ui-icon-carat-r ui-btn-icon-right'>Accedi alla scheda azienda</a></p>"; // WEB

                    }
                });
                //append list to ul
                var htmlObject = $(scheda);

                $("#footer_dettaglio").append(footer_dettaglio).promise().done(function () { });
                $("#scheda_newsPromo").append(htmlObject).promise().done(function () { });




            });
        })   



    </script>

</body>
</html>
