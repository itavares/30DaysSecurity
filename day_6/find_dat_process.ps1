# param([string]$pname)
# Write-Host $pname

#===============================
#AUTHOR           :        Ighor Tavares (@sum_b0dy)
#PURPOSE          :        30DaysSecurity Project
#DAY              :        DAY - 6
#SPECIAL NOTES    :        Feel free to use this script. Give me a shout-out if you do so :P (if you feel nice of course)
#===============================

function Show-Menu{
    param(
        [String]$Title = 'Kill That Beach!'
    )
        Clear-Host
        Write-Host "=================== Kill That Beach ==================="

        Write-Host "[S] : Search process by name"
        Write-Host "[K] : Kill Process (if name is known) "
        Write-Host "[q] : Quit program"
    
}

function Show-Menu-S{
    param(
        [String]$Title = 'Would would like to kill this process/es?'
    )
        Write-Host "=================== $title ==================="

        Write-Host "[Y] : Yes "
        Write-Host "[N] : No "
    
}



Show-Menu -Title 'Kill That Beach'
#set options

$selection = Read-Host "Please select option:"


switch($selection)
{
    'S'{
        "Write the process mame you would like to find"
        $pname = Read-Host  "Name: "
        Get-Process | Where {$_.ProcessName -Like "$pname*"}


        Show-Menu-S -Title 'Would would like to kill this process/es?'

        $ans = Read-Host "Select Option: "

        switch($ans)
        {
            'Y'{
               Get-Process | Where {$_.ProcessName -Like "$pname*"} | Stop-Process
               echo $pp
            }
            'N'{
                "Process not killed. Quitting program..."
                break
            }
        }

    } 
    'K' {
        "Write the process name you would like to kill"
        $pname = Read-Host "Name: "
        Get-Process | Where {$_.ProcessName -Like "$pname*"} | Stop-Process
    }
    'q'{
        return
    }
}
