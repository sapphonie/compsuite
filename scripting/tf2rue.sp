#include <sourcemod>
#include <sdktools>
#include <dhooks>
#include <sourcescramble>
#include <tf2>
#include <SteamWorks>
#include <concolors>

#define tagtag ansi_reset ... "[" ... ansi_bright_red ... "tf" ... ansi_bright_green ... "2" ... ansi_bright_red ... "rue" ... ansi_reset ... "] "

GameData tf2rue_gamedata;

#include <tf2rue/items.sp>
// #include <tf2rue/stv.sp>
// #include <tf2rue/fov.sp>

public void OnPluginStart()
{
    DoGamedata();
    DoMemPatches();
    DoConVars();
}

void DoGamedata()
{
    // main gamedata cfg
    tf2rue_gamedata = LoadGameConfigFile("tf2.rue");
    if (tf2rue_gamedata == null)
    {
        PrintToServer(tagtag ... "Couldn't load gamedata!");
        SetFailState("[tf2rue] Couldn't load gamedata");
    }

    DoItemsGamedata();
}

void DoMemPatches()
{
    DoItemsMemPatches();
}

void DoConVars()
{
    DoItemsConVars();
}

bool IsStringNumeric(const char[] str, int nBase=10)
{
    int result;
    return StringToIntEx(str, result, nBase) == strlen(str);
}
