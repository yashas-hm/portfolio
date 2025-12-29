export interface MailRequest {
  name?: string;
  email: string;
  message: string;
}

export interface MailResponse {
  success: boolean;
  message: string;
}
