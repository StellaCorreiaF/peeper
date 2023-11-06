<template>
  <div>
    <div v-if="showLogin">
      <h2>Login</h2>
      <div class="field">
        <label for="login-email">Email</label>
        <input type="email" id="login-email" v-model="loginEmail" />
      </div>
      <div class="field">
        <label for="login-password">Password</label>
        <input type="password" id="login-password" v-model="loginPassword" />
      </div>
      <div class="actions">
        <button @click="doLogin">Log in</button>
        <p>Don't have an account? <a @click="showRegistrationForm">Register</a></p>
      </div>
    </div>
    <div v-else>
      <h2>Register</h2>
      <div class="field">
        <label for="register-name">Name</label>
        <input type="text" id="register-name" v-model="registerName" />
      </div>
      <div class="field">
        <label for="register-email">Email</label>
        <input type="email" id="register-email" v-model="registerEmail" />
      </div>
      <div class="field">
        <label for="register-password">Password</label>
        <input type="password" id="register-password" v-model="registerPassword" />
      </div>
      <div class="field">
        <label for="register-password-confirmation">Password Confirmation</label>
        <input type="password" id="register-password-confirmation" v-model="registerPasswordConfirmation" />
      </div>
      <div class="field">
        <label for="register-profile-image">Profile Image</label>
        <input type="file" id="register-profile-image" @change="handleImageUpload" />
      </div>
      <div class="actions">
        <button @click="doRegistration">Register</button>
        <p>Already have an account? <a @click="showLoginForm">Log in</a></p>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent, ref } from "vue";
import { fazerLogin, fazerRegistro } from "@/auth";

export default defineComponent({
  setup() {
    const showLogin = ref(true);
    // Campos de login
    const loginEmail = ref("");
    const loginPassword = ref("");
    // Campos de registro
    const registerName = ref("");
    const registerEmail = ref("");
    const registerPassword = ref("");
    const registerPasswordConfirmation = ref("");
    const registerProfileImage = ref(null);

    const doLogin = async () => {
      try {
        await fazerLogin(loginEmail.value, loginPassword.value);
        // Lida com o login bem-sucedido
      } catch (error) {
        // Lida com erros de login
      }
    };

    const doRegistration = async () => {
      try {
        await fazerRegistro(registerName.value, registerEmail.value, registerPassword.value, registerPasswordConfirmation.value, registerProfileImage.value);
        // Lida com o registro bem-sucedido
      } catch (error) {
        // Lida com erros de registro
      }
    };

    const showRegistrationForm = () => {
      showLogin.value = false;
    };

    const showLoginForm = () => {
      showLogin.value = true;
    };

    return {
      showLogin,
      loginEmail,
      loginPassword,
      registerName,
      registerEmail,
      registerPassword,
      registerPasswordConfirmation,
      registerProfileImage,
      doLogin,
      doRegistration,
      showRegistrationForm,
      showLoginForm,
    };
  },
});
</script>
