// auth.ts

import api from "./http"; // Importe a instância da API do arquivo http.ts

export async function fazerLogin(email: string, password: string) {
  try {
    const response = await api.post("/api/users/sign_in", {
      email: email,
      password: password,
    });

    if (response.ok) {
      // Lida com a resposta de sucesso
      return response.data; // Ou qualquer outra ação apropriada
    } else {
      // Lida com a resposta de erro
      throw new Error("Erro de autenticação");
    }
  } catch (error) {
    // Lida com erros de rede
    throw new Error("Erro de rede");
  }
}

export async function fazerRegistro(name: string, email: string, password: string, password_confirmation: string, profile_image: File | null) {
  try {
    const formData = new FormData();
    formData.append("name", name);
    formData.append("email", email);
    formData.append("password", password);
    formData.append("password_confirmation", password_confirmation);

    if (profile_image) {
      formData.append("profile_image", profile_image);
    }

    const response = await api.post("/api/users/sign_up", formData);

    if (response.ok) {
      // Lida com a resposta de sucesso
      return response.data; // Ou qualquer outra ação apropriada
    } else {
      // Lida com a resposta de erro
      throw new Error("Erro de registro");
    }
  } catch (error) {
    // Lida com erros de rede
    throw new Error("Erro de rede");
  }
}
