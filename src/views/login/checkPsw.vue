<!-- 修改密码第二步 -->
<template>
  <logintemplate>
    <div slot="name">忘记密码</div>
    <div slot="form">
      <myinput
        type="check"
        :formValue="form.check"
        :err="checkErr"
        :errorMsg="checkErrMsg"
        @rulecheck="inputcheck"
        placeholder="请输入验证码"
      ></myinput>
      <myinput
        type="password"
        :formValue="form.psw"
        :err="pswErr"
        :errorMsg="pswErrMsg"
        @rulecheck="inputpsw"
        placeholder="密码长度在6-16位之间"
      ></myinput>
      <myinput
        type="password"
        :formValue="form.checkpsw"
        :err="pswcheckErr"
        :errorMsg="pswcheckErrMsg"
        @rulecheck="inputpswcheck"
        placeholder="请再次输入密码"
      ></myinput>
    </div>
    <div slot="login">
      <el-button type="primary" @click="sure" :loading="isLoading" class="loginbtn">下一步</el-button>
    </div>
    <div slot="changestate">
      <el-link class="pswbtn" type="info" @click="back">去登录</el-link>
    </div>
  </logintemplate>
</template>


<script>
//这里可以导入其他文件（比如：组件，工具js，第三方插件js，json文件，图片文件等等）
//例如：import 《组件名称》 from '《组件路径》';
import logintemplate from "../../components/logintemplate";
import myinput from "../../components/input/input";
import { mdfLabPsw } from "../../network";
export default {
  //import引入的组件需要注入到对象中才能使用
  components: {
    logintemplate,
    myinput
  },
  data() {
    //这里存放数据
    return {
      isLoading: false,
      checkErr: false,
      pswErr: false,
      pswcheckErr: false,
      checkErrMsg: "",
      pswErrMsg: "",
      pswcheckErrMsg: "",
      form: {
        check: "",
        psw: "",
        checkpsw: ""
      }
    };
  },
  //监听属性 类似于data概念
  computed: {},
  //监控data中的数据变化
  watch: {},
  //方法集合
  methods: {
    back() {
      this.$router.push("index");
    },
    sure() {
      if (this.checkErr || this.pswErr || this.pswcheckErr) {
        return;
      }
      mdfLabPsw({
        phoneCode: this.form.check,
        newPwd: this.form.checkpsw
      }).then(res => {
        console.log(res);
        if (res.data.SUCCESS) {
          this.$router.push("success");
        }else{
          const psw = /密码/
          const check = /验证/
          if(check.test(res.data.ERROR)){
            this.checkErr = true
            this.checkErrMsg = res.data.ERROR
          }else{
            this.pswErr = true
            this.pswErrMsg = res.data.ERROR
          }
        }
      });
    },
    inputcheck(value) {
      this.form.check = value;
      if (value.length !== 4) {
        this.checkErr = true;
        this.checkErrMsg = "请输入正确的验证码";
      } else {
        this.checkErr = false;
      }
    },
    inputpsw(value) {
      this.form.psw = value;
      if (value.length < 6 || value.length > 16) {
        this.pswErr = true;
        this.pswErrMsg = "请输入长度正确的密码";
      } else {
        this.pswErr = false;
      }
    },
    inputpswcheck(value) {
      this.form.checkpsw = value;
      if (value !== this.form.psw) {
        this.pswcheckErr = true;
        this.pswcheckErrMsg = "两次输入的密码不同!";
      } else {
        this.pswcheckErr = false;
      }
    }
  },
  //生命周期 - 创建完成（可以访问当前this实例）
  created() {},
  //生命周期 - 挂载完成（可以访问DOM元素）
  mounted() {},
  beforeCreate() {}, //生命周期 - 创建之前
  beforeMount() {}, //生命周期 - 挂载之前
  beforeUpdate() {}, //生命周期 - 更新之前
  updated() {}, //生命周期 - 更新之后
  beforeDestroy() {}, //生命周期 - 销毁之前
  destroyed() {}, //生命周期 - 销毁完成
  activated() {}, //如果页面有keep-alive缓存功能，这个函数会触发
  deactivated() {} //如果有keep-alive缓存功能,当该页面撤销使这个函数会触发
};
</script>
<style scoped>
</style>