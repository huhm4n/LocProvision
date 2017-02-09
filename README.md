# LocProvision
Please read this before using it. (Well if you don't now, you'll come back for it anyways)

Here's how the directories are setup:

LocProvision
 psscripts
 
       -> application (contains script to create directory, copy from templates, function to run vagrant command and notification)
              - deploy_ansible.ps1
              - deploy_linux6.ps1
              - deploy_linux7.ps1
        -> call (contains script to call method within application function) 
              - call_ansible.ps1
              - call_linux6.ps1
              - call_linux7.ps1
        -> menu (ps scripts for menu)
              - menu_d.ps1 (deprovison menu face)
              - menu_front.ps1 (front face)
              - menu_p.ps1 (provision menu face)
              - menud_trigger.ps1 (trigger deprovision menu)
              - menup_trigger.ps1 (trigger provision menu)
              - menupd_trigger.ps1 (trigger main menu)**
 
 **Need to create shortcut of this and put it in Desktop. 
 
 -> vagrant_f (Where vagrant files for servers will be located)
      - ReadmeFirst.txt (Random file for git purpose, please delete it after you done cloning)
 
 -> vagrant_template (vagrant templates for applications)
        -> ansible
              - Vagrantfile
              -> provision
                    - set_hostname.sh
        -> linux6
              - Vagrantfile
              -> provision
                    - set_hostname.sh
        -> linux7
              - Vagrantfile
              -> provision
                    - set_hostname.sh
                    
                   


Platform for best performance:

VirtualBox: 5.0.20 r106931 or above
Vagrant: 1.8.4 or above
Powershell: 4 or above
