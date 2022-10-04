String authErrorString(String? code) {
  switch (code) {
    case 'INVALID_CREDENTIALS':
      return 'Email ou senha inválidos!';

    case 'Invalid session token':
      return 'Token inválido!';

    case 'INVALID_FULLNAME':
      return 'Ocorreu um erro ao cadatrar o usuário: Nome inválido!';

    case 'INVALID_PHONE':
      return 'Ocorreu um erro ao cadatrar o usuário: Número de telefone inválido!';

    case 'INVALID_CPF':
      return 'Ocorreu um erro ao cadatrar o usuário: CPF inválido!';

    default:
      return 'Ocorreu um erro inesperado!';
  }
}
