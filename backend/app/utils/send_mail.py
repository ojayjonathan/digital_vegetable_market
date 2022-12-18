import smtplib
import ssl
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText


def send_mail(
    port: int,
    smtp_server: str,
    sender: str,
    recipient: str,
    sender_password: str,
    message: str,
    subject: str,
    contentType="plain",
    extra=None,
):
    print("Connecting to server")
    with smtplib.SMTP(smtp_server, port) as server:
        server.starttls()
        print("Loging in .....")
        server.login(sender, sender_password)
        print("Sending mail")

        mimemsg = MIMEMultipart()
        mimemsg["From"] = sender
        mimemsg["To"] = recipient
        mimemsg["Subject"] = subject
        mimemsg.attach(MIMEText(message, contentType))
        if extra:
            mimemsg.attach(extra)
        server.sendmail(sender ,recipient, mimemsg.as_string())

        print(f"Email send to {recipient}")
        server.close()

