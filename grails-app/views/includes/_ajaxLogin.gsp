<style>
#ajaxLogin {
    background-color: #eeeeff;
    display: none;
}
#ajaxLogin .inner {
    width: 260px;
    margin:0px auto;
    text-align:left;
    padding:10px;
    border-top:1px dashed #499ede;
    border-bottom:1px dashed #499ede;
    background-color:#EEF;
}
#ajaxLogin .inner .fheader {
    padding:4px;margin:3px 0px 3px 0;color:#2e3741;font-size:14px;font-weight:bold;
}
#ajaxLogin .inner .cssform p {
    clear: left;
    margin: 0;
    padding: 5px 0 8px 0;
    padding-left: 105px;
    border-top: 1px dashed gray;
    margin-bottom: 10px;
    height: 1%;
}
#ajaxLogin .inner .cssform input[type='text'] {
    width: 120px;
}
#ajaxLogin .inner .cssform label{
    font-weight: bold;
    float: left;
    margin-left: -105px;
    width: 100px;
}
#ajaxLogin .inner .login_message {color:red;}
#ajaxLogin .inner .text_ {width:120px;}
#ajaxLogin .inner .chk {height:12px;}
.errorMessage { color: red; }
</style>

<div id='ajaxLogin' class="jqmWindow" style="z-index: 3000;">
    <div class='inner'>
        <div class='fheader'>Please Login..</div>
        <form action='${request.contextPath}/j_spring_security_check' method='POST'
              id='ajaxLoginForm' name='ajaxLoginForm' class='cssform'>
            <p>
                <label for='username'>Login ID</label>
                <input type='text' class='text_' name='j_username' id='username' />
            </p>
            <p>
                <label for='password'>Password</label>
                <input type='password' class='text_' name='j_password' id='password' />
            </p>
            <p>
                <label for='remember_me'>Remember me</label>
                <input type='checkbox' class='chk' id='remember_me'
                       name='_spring_security_remember_me'/>
            </p>
            <p>
                <a href='#' id="authAjax">Login</a>
                <a href='#' id="cancelLogin">Cancel</a>
            </p>
        </form>
        <div style='display: none; text-align: left;' id='loginMessage'></div>
    </div>
</div>

<script type='text/javascript'>

    var onLogin;
    $.ajaxSetup({
        beforeSend : function(xhr, event) {
            // save the 'success' function for later use
            onLogin = event.success;
        },
        statusCode: {
            // Set up a global AJAX error handler to handle the 401
            // unauthorized responses. If a 401 status code comes back,
            // the user is no longer logged-into the system and can not
            // use it properly.
            401: function() {
                showLogin();
            }
        }
    });

    function showLogin() {
        var ajaxLogin = $('#ajaxLogin');
        ajaxLogin.css('text-align','center');
        // use jqModal to show and align login panel
        ajaxLogin.jqmShow();
    }

    function cancelLogin() {
        $('#ajaxLogin').jqmHide();
    }

    function authAjax() {
        $('#loginMessage').html('Sending request ...').show();

        var form = $('#ajaxLoginForm');
        var config = {
            type : 'post'
            ,url : form.attr('action')
            ,data : form.serialize()
            ,async : false
            ,dataType : 'JSON'
            ,success: function(response) {
                form[0].reset();
                $('#loginMessage').empty();
                $('#ajaxLogin').jqmHide();
                if (onLogin) {
                    // execute the saved event.success function
                    onLogin(response);
                }
            }
            ,error : function (response) {
                var responseText = response.responseText || '[]';
                var json = responseText.evalJSON();
                if (json.error) {
                    $('#loginMessage').html("<span class='errorMessage'>" + json.error + '</error>');
                } else {
                    $('#loginMessage').html(responseText);
                }
            }
            ,beforeSend : function(xhr, event) {
                //console.log("overriding default behaviour");
            }
        }
        $.ajax(config);
    }

    $(function() {
        $('#ajaxLogin').jqm({modal: true, trigger: 'span.jqmTrigger'});
        $('#authAjax').click(function(e) {
            e.preventDefault();
            authAjax();
        });
        $('#cancelLogin').click(function(e) {
            e.preventDefault();
            cancelLogin();
        });
    });
</script>