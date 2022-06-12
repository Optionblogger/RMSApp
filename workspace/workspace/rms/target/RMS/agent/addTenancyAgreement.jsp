<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container-fluid section">
    <h3 class="text-center main-title" id="title">
        <i class="fa fa-plus-circle"></i>&nbsp;&nbsp;ADD TENANACY AGREEMENT
    </h3>
    <form class="form-horizontal" method="post" id="form-add-tenancyAgreement">
        <div class="row">
            <div class="col-md-6">
                <fieldset>
                    <legend>
                    </legend>

                    <div class="form-group">
                        <label for="unitNumber" class="control-label">Unit No:</label> <select
                            name="unitNumber" id="unitNumber" class="form-control">
                        <option value="">Select Unit No...</option>
                        <c:forEach var="unit" items="${units}">
                            <option value="${unit.unitNumber}">
                                    ${unit.unitNumber}
                            </option>
                        </c:forEach>
                    </select>
                    </div>

                    <div class="form-group">
                        <label for="name" class="control-label">Tenant Name:</label>
                        <input
                                type="text" name="name" class="form-control"
                                id="name"
                                placeholder="Tenant Name">

                    </div>

                    <div class="form-group">
                        <label for="dateJoined" class="control-label">Date Joined:</label>
                        <input type="text" name="dateJoined" class="form-control datepicker" id="dateJoined"
                               placeholder="Date Joined">
                    </div>


                    <div class="form-group">
                        <label for="serviceCharge" class="control-label">Service Charge:</label>

                        <input
                                type="number" name="serviceCharge" class="form-control"
                                id="serviceCharge"
                                placeholder="Service charge">

                    </div>
                    <div class="form-group">
                        <label for="tenantCellNumber" class="control-label">PHONE
                            NUMBER</label>
                        <div class="form-inline">
                            <select class="form-control pull-left agent-country-code"
                                    name="country-code" style="width: 35%;"></select>
                            <input type="text" name="tenantCellNumber"
                                   class="form-control"
                                   id="tenantCellNumber" placeholder="Phone Number"
                                   style="width:65%"
                                   oninput="this.value=this.value.toUpperCase()">
                        </div>
                    </div>
                </fieldset>
            </div>
            <div class="col-md-6">
                <fieldset>
                    <legend>
                    </legend>
                    <div class="form-group">
                        <label for="tenantEmailaddress" class="control-label">Email Address:</label>

                        <input
                                type="email" name="tenantEmailaddress"
                                class="form-control"
                                id="tenantEmailaddress" placeholder="Email ">

                    </div>
                    <div class="form-group">
                        <label for="tenantPostalAddress" class="control-label">Postal
                            Address:</label>

                        <input type="text" name="tenantPostalAddress"
                               class="form-control" id="tenantPostalAddress"
                               placeholder="Postal Address ">

                    </div>
                    <div class="form-group">
                        <label for="tenantTown" class="control-label">Town
                            :</label>

                        <input type="text" name="tenantTown"
                               class="form-control" id="tenantTown"
                               placeholder="Town">


                    </div>
                </fieldset>
            </div>
            <div class="row">
                <div class="col-md-6">

                </div>
                <div class="col-md-6">
                    <button class="btn btn-warning pull-right">ADD</button>
                </div>
            </div>
        </div>
    </form>

</div>

<script type="text/javascript">

    $("#tenantCellNumber").on("keypress keyup", function () {
        if ($(this).val() == '0') {
            $(this).val('');
        }
    });

    $(".agent-country-code").append(
        "        <option data-countryCode='KE' value='+254' Selected>Kenya (+254)</option>\n" +
        "        <option data-countryCode='GH' value='+233'>Ghana (+233)</option>\n" +
        "        <option data-countryCode='US' value='+1'>USA (+1)</option>\n" +
        "        <option data-countryCode='DZ' value='+213'>Algeria (+213)</option>\n" +
        "        <option data-countryCode='AD' value='+376'>Andorra (+376)</option>\n" +
        "        <option data-countryCode='AO' value='+244'>Angola (+244)</option>\n" +
        "        <option data-countryCode='AI' value='+1264'>Anguilla (+1264)</option>\n" +
        "        <option data-countryCode='AG' value='+1268'>Antigua &amp; Barbuda (+1268)</option>\n" +
        "        <option data-countryCode='AR' value='+54'>Argentina (+54)</option>\n" +
        "        <option data-countryCode='AM' value='+374'>Armenia (+374)</option>\n" +
        "        <option data-countryCode='AW' value='+297'>Aruba (+297)</option>\n" +
        "        <option data-countryCode='AU' value='+61'>Australia (+61)</option>\n" +
        "        <option data-countryCode='AT' value='+43'>Austria (+43)</option>\n" +
        "        <option data-countryCode='AZ' value='+994'>Azerbaijan (+994)</option>\n" +
        "        <option data-countryCode='BS' value='+1242'>Bahamas (+1242)</option>\n" +
        "        <option data-countryCode='BH' value='+973'>Bahrain (+973)</option>\n" +
        "        <option data-countryCode='BD' value='+880'>Bangladesh (+880)</option>\n" +
        "        <option data-countryCode='BB' value='+1246'>Barbados (+1246)</option>\n" +
        "        <option data-countryCode='BY' value='+375'>Belarus (+375)</option>\n" +
        "        <option data-countryCode='BE' value='+32'>Belgium (+32)</option>\n" +
        "        <option data-countryCode='BZ' value='+501'>Belize (+501)</option>\n" +
        "        <option data-countryCode='BJ' value='+229'>Benin (+229)</option>\n" +
        "        <option data-countryCode='BM' value='+1441'>Bermuda (+1441)</option>\n" +
        "        <option data-countryCode='BT' value='+975'>Bhutan (+975)</option>\n" +
        "        <option data-countryCode='BO' value='+591'>Bolivia (+591)</option>\n" +
        "        <option data-countryCode='BA' value='+387'>Bosnia Herzegovina (+387)</option>\n" +
        "        <option data-countryCode='BW' value='+267'>Botswana (+267)</option>\n" +
        "        <option data-countryCode='BR' value='+55'>Brazil (+55)</option>\n" +
        "        <option data-countryCode='BN' value='+673'>Brunei (+673)</option>\n" +
        "        <option data-countryCode='BG' value='+359'>Bulgaria (+359)</option>\n" +
        "        <option data-countryCode='BF' value='+226'>Burkina Faso (+226)</option>\n" +
        "        <option data-countryCode='BI' value='+257'>Burundi (+257)</option>\n" +
        "        <option data-countryCode='KH' value='+855'>Cambodia (+855)</option>\n" +
        "        <option data-countryCode='CM' value='+237'>Cameroon (+237)</option>\n" +
        "        <option data-countryCode='CA' value='+1'>Canada (+1)</option>\n" +
        "        <option data-countryCode='CV' value='+238'>Cape Verde Islands (+238)</option>\n" +
        "        <option data-countryCode='KY' value='+1345'>Cayman Islands (+1345)</option>\n" +
        "        <option data-countryCode='CF' value='+236'>Central African Republic (+236)</option>\n" +
        "        <option data-countryCode='CL' value='+56'>Chile (+56)</option>\n" +
        "        <option data-countryCode='CN' value='+86'>China (+86)</option>\n" +
        "        <option data-countryCode='CO' value='+57'>Colombia (+57)</option>\n" +
        "        <option data-countryCode='KM' value='+269'>Comoros (+269)</option>\n" +
        "        <option data-countryCode='CG' value='+242'>Congo (+242)</option>\n" +
        "        <option data-countryCode='CK' value='+682'>Cook Islands (+682)</option>\n" +
        "        <option data-countryCode='CR' value='+506'>Costa Rica (+506)</option>\n" +
        "        <option data-countryCode='HR' value='+385'>Croatia (+385)</option>\n" +
        "        <option data-countryCode='CU' value='+53'>Cuba (+53)</option>\n" +
        "        <option data-countryCode='CY' value='+90392'>Cyprus North (+90392)</option>\n" +
        "        <option data-countryCode='CY' value='+357'>Cyprus South (+357)</option>\n" +
        "        <option data-countryCode='CZ' value='+42'>Czech Republic (+42)</option>\n" +
        "        <option data-countryCode='DK' value='+45'>Denmark (+45)</option>\n" +
        "        <option data-countryCode='DJ' value='+253'>Djibouti (+253)</option>\n" +
        "        <option data-countryCode='DM' value='+1809'>Dominica (+1809)</option>\n" +
        "        <option data-countryCode='DO' value='+1809'>Dominican Republic (+1809)</option>\n" +
        "        <option data-countryCode='EC' value='+593'>Ecuador (+593)</option>\n" +
        "        <option data-countryCode='EG' value='+20'>Egypt (+20)</option>\n" +
        "        <option data-countryCode='SV' value='+503'>El Salvador (+503)</option>\n" +
        "        <option data-countryCode='GQ' value='+240'>Equatorial Guinea (+240)</option>\n" +
        "        <option data-countryCode='ER' value='+291'>Eritrea (+291)</option>\n" +
        "        <option data-countryCode='EE' value='+372'>Estonia (+372)</option>\n" +
        "        <option data-countryCode='ET' value='+251'>Ethiopia (+251)</option>\n" +
        "        <option data-countryCode='FK' value='+500'>Falkland Islands (+500)</option>\n" +
        "        <option data-countryCode='FO' value='+298'>Faroe Islands (+298)</option>\n" +
        "        <option data-countryCode='FJ' value='+679'>Fiji (+679)</option>\n" +
        "        <option data-countryCode='FI' value='+358'>Finland (+358)</option>\n" +
        "        <option data-countryCode='FR' value='+33'>France (+33)</option>\n" +
        "        <option data-countryCode='GF' value='+594'>French Guiana (+594)</option>\n" +
        "        <option data-countryCode='PF' value='+689'>French Polynesia (+689)</option>\n" +
        "        <option data-countryCode='GA' value='+241'>Gabon (+241)</option>\n" +
        "        <option data-countryCode='GM' value='+220'>Gambia (+220)</option>\n" +
        "        <option data-countryCode='GE' value='+7880'>Georgia (+7880)</option>\n" +
        "        <option data-countryCode='DE' value='+49'>Germany (+49)</option>\n" +
        "        <option data-countryCode='GH' value='+233'>Ghana (+233)</option>\n" +
        "        <option data-countryCode='GI' value='+350'>Gibraltar (+350)</option>\n" +
        "        <option data-countryCode='GR' value='+30'>Greece (+30)</option>\n" +
        "        <option data-countryCode='GL' value='+299'>Greenland (+299)</option>\n" +
        "        <option data-countryCode='GD' value='+1473'>Grenada (+1473)</option>\n" +
        "        <option data-countryCode='GP' value='+590'>Guadeloupe (+590)</option>\n" +
        "        <option data-countryCode='GU' value='+671'>Guam (+671)</option>\n" +
        "        <option data-countryCode='GT' value='+502'>Guatemala (+502)</option>\n" +
        "        <option data-countryCode='GN' value='+224'>Guinea (+224)</option>\n" +
        "        <option data-countryCode='GW' value='+245'>Guinea - Bissau (+245)</option>\n" +
        "        <option data-countryCode='GY' value='+592'>Guyana (+592)</option>\n" +
        "        <option data-countryCode='HT' value='+509'>Haiti (+509)</option>\n" +
        "        <option data-countryCode='HN' value='+504'>Honduras (+504)</option>\n" +
        "        <option data-countryCode='HK' value='+852'>Hong Kong (+852)</option>\n" +
        "        <option data-countryCode='HU' value='+36'>Hungary (+36)</option>\n" +
        "        <option data-countryCode='IS' value='+354'>Iceland (+354)</option>\n" +
        "        <option data-countryCode='IN' value='+91'>India (+91)</option>\n" +
        "        <option data-countryCode='ID' value='+62'>Indonesia (+62)</option>\n" +
        "        <option data-countryCode='IR' value='+98'>Iran (+98)</option>\n" +
        "        <option data-countryCode='IQ' value='+964'>Iraq (+964)</option>\n" +
        "        <option data-countryCode='IE' value='+353'>Ireland (+353)</option>\n" +
        "        <option data-countryCode='IL' value='+972'>Israel (+972)</option>\n" +
        "        <option data-countryCode='IT' value='+39'>Italy (+39)</option>\n" +
        "        <option data-countryCode='JM' value='+1876'>Jamaica (+1876)</option>\n" +
        "        <option data-countryCode='JP' value='+81'>Japan (+81)</option>\n" +
        "        <option data-countryCode='JO' value='+962'>Jordan (+962)</option>\n" +
        "        <option data-countryCode='KZ' value='+7'>Kazakhstan (+7)</option>\n" +
        "        <option data-countryCode='KI' value='+686'>Kiribati (+686)</option>\n" +
        "        <option data-countryCode='KP' value='+850'>Korea North (+850)</option>\n" +
        "        <option data-countryCode='KR' value='+82'>Korea South (+82)</option>\n" +
        "        <option data-countryCode='KW' value='+965'>Kuwait (+965)</option>\n" +
        "        <option data-countryCode='KG' value='+996'>Kyrgyzstan (+996)</option>\n" +
        "        <option data-countryCode='LA' value='+856'>Laos (+856)</option>\n" +
        "        <option data-countryCode='LV' value='+371'>Latvia (+371)</option>\n" +
        "        <option data-countryCode='LB' value='+961'>Lebanon (+961)</option>\n" +
        "        <option data-countryCode='LS' value='+266'>Lesotho (+266)</option>\n" +
        "        <option data-countryCode='LR' value='+231'>Liberia (+231)</option>\n" +
        "        <option data-countryCode='LY' value='+218'>Libya (+218)</option>\n" +
        "        <option data-countryCode='LI' value='+417'>Liechtenstein (+417)</option>\n" +
        "        <option data-countryCode='LT' value='+370'>Lithuania (+370)</option>\n" +
        "        <option data-countryCode='LU' value='+352'>Luxembourg (+352)</option>\n" +
        "        <option data-countryCode='MO' value='+853'>Macao (+853)</option>\n" +
        "        <option data-countryCode='MK' value='+389'>Macedonia (+389)</option>\n" +
        "        <option data-countryCode='MG' value='+261'>Madagascar (+261)</option>\n" +
        "        <option data-countryCode='MW' value='+265'>Malawi (+265)</option>\n" +
        "        <option data-countryCode='MY' value='+60'>Malaysia (+60)</option>\n" +
        "        <option data-countryCode='MV' value='+960'>Maldives (+960)</option>\n" +
        "        <option data-countryCode='ML' value='+223'>Mali (+223)</option>\n" +
        "        <option data-countryCode='MT' value='+356'>Malta (+356)</option>\n" +
        "        <option data-countryCode='MH' value='+692'>Marshall Islands (+692)</option>\n" +
        "        <option data-countryCode='MQ' value='+596'>Martinique (+596)</option>\n" +
        "        <option data-countryCode='MR' value='+222'>Mauritania (+222)</option>\n" +
        "        <option data-countryCode='YT' value='+269'>Mayotte (+269)</option>\n" +
        "        <option data-countryCode='MX' value='+52'>Mexico (+52)</option>\n" +
        "        <option data-countryCode='FM' value='+691'>Micronesia (+691)</option>\n" +
        "        <option data-countryCode='MD' value='+373'>Moldova (+373)</option>\n" +
        "        <option data-countryCode='MC' value='+377'>Monaco (+377)</option>\n" +
        "        <option data-countryCode='MN' value='+976'>Mongolia (+976)</option>\n" +
        "        <option data-countryCode='MS' value='+1664'>Montserrat (+1664)</option>\n" +
        "        <option data-countryCode='MA' value='+212'>Morocco (+212)</option>\n" +
        "        <option data-countryCode='MZ' value='+258'>Mozambique (+258)</option>\n" +
        "        <option data-countryCode='MN' value='+95'>Myanmar (+95)</option>\n" +
        "        <option data-countryCode='NA' value='+264'>Namibia (+264)</option>\n" +
        "        <option data-countryCode='NR' value='+674'>Nauru (+674)</option>\n" +
        "        <option data-countryCode='NP' value='+977'>Nepal (+977)</option>\n" +
        "        <option data-countryCode='NL' value='+31'>Netherlands (+31)</option>\n" +
        "        <option data-countryCode='NC' value='+687'>New Caledonia (+687)</option>\n" +
        "        <option data-countryCode='NZ' value='+64'>New Zealand (+64)</option>\n" +
        "        <option data-countryCode='NI' value='+505'>Nicaragua (+505)</option>\n" +
        "        <option data-countryCode='NE' value='+227'>Niger (+227)</option>\n" +
        "        <option data-countryCode='NG' value='+234'>Nigeria (+234)</option>\n" +
        "        <option data-countryCode='NU' value='+683'>Niue (+683)</option>\n" +
        "        <option data-countryCode='NF' value='+672'>Norfolk Islands (+672)</option>\n" +
        "        <option data-countryCode='NP' value='+670'>Northern Marianas (+670)</option>\n" +
        "        <option data-countryCode='NO' value='+47'>Norway (+47)</option>\n" +
        "        <option data-countryCode='OM' value='+968'>Oman (+968)</option>\n" +
        "        <option data-countryCode='PW' value='+680'>Palau (+680)</option>\n" +
        "        <option data-countryCode='PA' value='+507'>Panama (+507)</option>\n" +
        "        <option data-countryCode='PG' value='+675'>Papua New Guinea (+675)</option>\n" +
        "        <option data-countryCode='PY' value='+595'>Paraguay (+595)</option>\n" +
        "        <option data-countryCode='PE' value='+51'>Peru (+51)</option>\n" +
        "        <option data-countryCode='PH' value='+63'>Philippines (+63)</option>\n" +
        "        <option data-countryCode='PL' value='+48'>Poland (+48)</option>\n" +
        "        <option data-countryCode='PT' value='+351'>Portugal (+351)</option>\n" +
        "        <option data-countryCode='PR' value='+1787'>Puerto Rico (+1787)</option>\n" +
        "        <option data-countryCode='QA' value='+974'>Qatar (+974)</option>\n" +
        "        <option data-countryCode='RE' value='+262'>Reunion (+262)</option>\n" +
        "        <option data-countryCode='RO' value='+40'>Romania (+40)</option>\n" +
        "        <option data-countryCode='RU' value='+7'>Russia (+7)</option>\n" +
        "        <option data-countryCode='RW' value='+250'>Rwanda (+250)</option>\n" +
        "        <option data-countryCode='SM' value='+378'>San Marino (+378)</option>\n" +
        "        <option data-countryCode='ST' value='+239'>Sao Tome &amp; Principe (+239)</option>\n" +
        "        <option data-countryCode='SA' value='+966'>Saudi Arabia (+966)</option>\n" +
        "        <option data-countryCode='SN' value='+221'>Senegal (+221)</option>\n" +
        "        <option data-countryCode='CS' value='+381'>Serbia (+381)</option>\n" +
        "        <option data-countryCode='SC' value='+248'>Seychelles (+248)</option>\n" +
        "        <option data-countryCode='SL' value='+232'>Sierra Leone (+232)</option>\n" +
        "        <option data-countryCode='SG' value='+65'>Singapore (+65)</option>\n" +
        "        <option data-countryCode='SK' value='+421'>Slovak Republic (+421)</option>\n" +
        "        <option data-countryCode='SI' value='+386'>Slovenia (+386)</option>\n" +
        "        <option data-countryCode='SB' value='+677'>Solomon Islands (+677)</option>\n" +
        "        <option data-countryCode='SO' value='+252'>Somalia (+252)</option>\n" +
        "        <option data-countryCode='ZA' value='+27'>South Africa (+27)</option>\n" +
        "        <option data-countryCode='ES' value='+34'>Spain (+34)</option>\n" +
        "        <option data-countryCode='LK' value='+94'>Sri Lanka (+94)</option>\n" +
        "        <option data-countryCode='SH' value='+290'>St. Helena (+290)</option>\n" +
        "        <option data-countryCode='KN' value='+1869'>St. Kitts (+1869)</option>\n" +
        "        <option data-countryCode='SC' value='+1758'>St. Lucia (+1758)</option>\n" +
        "        <option data-countryCode='SD' value='+249'>Sudan (+249)</option>\n" +
        "        <option data-countryCode='SR' value='+597'>Suriname (+597)</option>\n" +
        "        <option data-countryCode='SZ' value='+268'>Swaziland (+268)</option>\n" +
        "        <option data-countryCode='SE' value='+46'>Sweden (+46)</option>\n" +
        "        <option data-countryCode='CH' value='+41'>Switzerland (+41)</option>\n" +
        "        <option data-countryCode='SI' value='+963'>Syria (+963)</option>\n" +
        "        <option data-countryCode='TW' value='+886'>Taiwan (+886)</option>\n" +
        "        <option data-countryCode='TJ' value='+7'>Tajikstan (+7)</option>\n" +
        "        <option data-countryCode='TH' value='+66'>Thailand (+66)</option>\n" +
        "        <option data-countryCode='TG' value='+228'>Togo (+228)</option>\n" +
        "        <option data-countryCode='TO' value='+676'>Tonga (+676)</option>\n" +
        "        <option data-countryCode='TT' value='+1868'>Trinidad &amp; Tobago (+1868)</option>\n" +
        "        <option data-countryCode='TN' value='+216'>Tunisia (+216)</option>\n" +
        "        <option data-countryCode='TR' value='+90'>Turkey (+90)</option>\n" +
        "        <option data-countryCode='TM' value='+7'>Turkmenistan (+7)</option>\n" +
        "        <option data-countryCode='TM' value='+993'>Turkmenistan (+993)</option>\n" +
        "        <option data-countryCode='TC' value='+1649'>Turks &amp; Caicos Islands (+1649)</option>\n" +
        "        <option data-countryCode='TV' value='+688'>Tuvalu (+688)</option>\n" +
        "        <option data-countryCode='UG' value='+256'>Uganda (+256)</option>\n" +
        "        <option data-countryCode='GB' value='+44'>UK (+44)</option>\n" +
        "        <option data-countryCode='UA' value='+380'>Ukraine (+380)</option>\n" +
        "        <option data-countryCode='AE' value='+971'>United Arab Emirates (+971)</option>\n" +
        "        <option data-countryCode='UY' value='+598'>Uruguay (+598)</option>\n" +
        "        <option data-countryCode='US' value='+1'>USA (+1)</option>\n" +
        "        <option data-countryCode='UZ' value='+7'>Uzbekistan (+7)</option>\n" +
        "        <option data-countryCode='VU' value='+678'>Vanuatu (+678)</option>\n" +
        "        <option data-countryCode='VA' value='+379'>Vatican City (+379)</option>\n" +
        "        <option data-countryCode='VE' value='+58'>Venezuela (+58)</option>\n" +
        "        <option data-countryCode='VN' value='+84'>Vietnam (+84)</option>\n" +
        "        <option data-countryCode='VG' value='+84'>Virgin Islands - British (+1284)</option>\n" +
        "        <option data-countryCode='VI' value='+84'>Virgin Islands - US (+1340)</option>\n" +
        "        <option data-countryCode='WF' value='+681'>Wallis &amp; Futuna (+681)</option>\n" +
        "        <option data-countryCode='YE' value='+969'>Yemen (North)(+969)</option>\n" +
        "        <option data-countryCode='YE' value='+967'>Yemen (South)(+967)</option>\n" +
        "        <option data-countryCode='ZM' value='+260'>Zambia (+260)</option>\n" +
        "        <option data-countryCode='ZW' value='+263'>Zimbabwe (+263)</option>\n" +
        "    </optgroup>\n"
    );

    $('#dateJoined')
        .datetimepicker({
            language: 'en',
            weekStart: 1,
            todayBtn: 1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0,
            format: 'yy-mm-dd'
        })
        .on('changeDate', function (e) {
            // Revalidate the date field
            $('#form-add-tenancyAgreement').bootstrapValidator('revalidateField', 'dateJoined');

        });

    $(document).ready(function () {
        $('#form-add-tenancyAgreement')
            .bootstrapValidator(
                {
                    excluded: ':disabled',
                    message: 'This value is not valid',
                    feedbackIcons: {
                        valid: 'glyphicon glyphicon-ok',
                        invalid: 'glyphicon glyphicon-remove',
                        validating: 'glyphicon glyphicon-refresh'
                    },
                    fields: {
                        unitNumber: {
                            validators: {
                                notEmpty: {
                                    message: 'Please enter Unit Number'
                                }
                            }
                        },
                        name: {
                            validators: {
                                notEmpty: {
                                    message: 'Please enter your name'
                                }
                            }
                        },

                        tenantPostalAddress: {
                            validators: {
                                notEmpty: {
                                    message: 'Please Enter your Address'
                                }
                            }
                        },
                        tenantEmailaddress: {
                            validators: {
                                notEmpty: {
                                    message: 'Please enter your email address'
                                }
                            }
                        },
                        tenantCellNumber: {
                            validators: {
                                notEmpty: {
                                    message: 'Please enter your phone number'
                                }
                            }
                        },
                        tenantTown: {
                            validators: {
                                notEmpty: {
                                    message: 'Please enter your town/city'
                                }
                            }
                        }
                        ,
                        dateJoined: {
                            validators: {
                                notEmpty: {
                                    message: 'Please enter Date joined'
                                }
                            }
                        }

                    }
                })
            .on(
                'success.form.bv',
                function (e) {
                    e.preventDefault();
                    $.ajax({
                        url: $('#base_url').val() + 'agent',
                        type: 'post',
                        data: {
                            ACTION: 'ADD_TENANANCY_AGREEMENT',
                            name: $('#name')
                                .val(),
                            unitNumber: $('#unitNumber')
                                .val(),
                            serviceCharge: $('#serviceCharge')
                                .val(),
                            tenantEmailaddress: $('#tenantEmailaddress')
                                .val(),
                            tenantCellNumber: $('#tenantCellNumber')
                                .val(),
                            tenantPostalAddress: $('#tenantPostalAddress')
                                .val(),
                            tenantTown: $('#tenantTown')
                                .val(),
                            dateJoined: $('#dateJoined')
                                .val(),
                        },
                        dataType:
                            'json',
                        success: function (json) {
                            $("form#form-add-tenancyAgreement")[0]
                                .reset();
                            bootbox.alert("<p class=\"text-center\">" + json.message + "</p>");
                            setTimeout(
                                function () {
                                    window.location.href = $(
                                        '#base_url')
                                            .val()
                                        + 'agent';
                                }, 500);
                        }
                    })
                    ;
                });


    });
</script>

