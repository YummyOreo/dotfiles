import threading

def e():
    import subprocess
    subprocess.call('powershell -c explorer .')

t = threading.Thread(target=e)
t.start()
