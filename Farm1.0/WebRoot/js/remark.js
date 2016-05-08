$(function () {
    H_reg = {};
    H_reg.openLogin = function(){
        $('.reg-header').click(function(){
            $('.reg').show();
            $('.reg-bg').show();
        });
    };
    H_reg.closeLogin = function(){
        $('.close-reg').click(function(){
            $('.reg').hide();
            $('.reg-bg').hide();
        });
    };
    H_reg.loginForm = function () {
        $("#reg-button-submit").on('click',function(){
              var username = $("#username");
              var usernameValue = $("#username").val();
              var password = $("#password");
              var passwordValue = $("#password").val();
            if(usernameValue == ""){
                alert("用户名不能为空");
                username.focus();
                return false;
            }else if(usernameValue.length > 15){
                alert("用户名长度不能大于15字符");
                username.focus();
                return false;
            }else if(passwordValue == ""){
                alert("密码不能为空");
                password.focus();
                return false;
            }else if(passwordValue.length < 6 || passwordValue.length > 30){
                alert("密码长度不能小于6或大于30位字符");
                password.focus();
                return false;
            }else{
                alert("登录成功");
                setTimeout(function(){
                    $('.reg').hide();
                    $('.reg-bg').hide();
                    $('.list-input').val('');
                },2000);
            }
        });
    };
    H_reg.run = function () {
        this.closeLogin();
        this.openLogin();
        this.loginForm();
    };
    H_reg.run();
});