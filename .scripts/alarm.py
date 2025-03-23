import time
import os

def vol():
    global v
    v = input(r"""
    Default Alarm volume is your current volume
    Enter Alarm volume (x% format) : """)

def tone():
    global at
    at = input(r"""
    Default file is kitsui akira multilingual super idol
    Enter the path to the audio file (if spaces put it inside '') : """)

def alarm():
    pa = (os.popen("pactl get-sink-volume @DEFAULT_SINK@").read()).split("/")
    my_volume = pa[1].strip()  # Get current volume and remove extra spaces

    try:
        alarm_volume = v
    except NameError:
        alarm_volume = my_volume

    try:
        path_to_alarm_tone = at
    except NameError:
        path_to_alarm_tone = "~/Music/'Kitsui Akira - 热爱105°C的你 Super Idol (Multilingual).mp3'"

    desired_time = input("Enter your desired time in H:M:S format please : ")

    while True:
        formatted_time = time.strftime("%H:%M:%S", time.localtime())
        if formatted_time == desired_time:
            os.system(f"pactl set-sink-volume @DEFAULT_SINK@ {alarm_volume}")
            os.system(f"mpv --no-video {path_to_alarm_tone}")
            os.system(f"pactl set-sink-volume @DEFAULT_SINK@ {my_volume}")
            break
        time.sleep(1)

while True:
    choice = input('''
1. Set volume
2. Set alarm
3. Set alarm tone
Enter q to exit: ''')

    if choice == "1":
        vol()
    elif choice == "2":
        alarm()
    elif choice == "3":
        tone()
    elif choice.lower() == "q":
        break
    else:
        print("Invalid choice")
