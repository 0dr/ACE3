
class GVAR(updateCamo) {
    displayName = CSTRING(UpdateCamo);
    condition = QUOTE([ARR_2(_player, _target)] call FUNC(canUpdate));
    statement = ""; //QUOTE(call FUNC(create_dialog));
    showDisabled = 0;
    priority = 2;
    icon = QPATHTOF(UI\updateCamo_Icon.paa);
    exceptions[] = {"notOnMap", "isNotInside"};

    class Arid {
        displayName = CSTRING(Arid);
        condition = QUOTE([ARR_3(_player, _target, 'ARID')] call DFUNC(canUpdateCamo));
        exceptions[] = {"isNotInside", "isNotSwimming"};
        statement = QUOTE([ARR_3(_player, _target, 'ARID')] call DFUNC(updateCamo));
        showDisabled = 0;
        priority = 2;
    };
    class SemiArid:Arid {
        displayName = CSTRING(SemiArid);
        condition = QUOTE([ARR_3(_player, _target, 'SEMIARID')] call DFUNC(canUpdateCamo));
        statement = QUOTE([ARR_3(_player, _target, 'SEMIARID')] call DFUNC(updateCamo));
    };
    class Lush:Arid {
        displayName = CSTRING(Lush);
        condition = QUOTE([ARR_3(_player, _target, 'LUSH')] call DFUNC(canUpdateCamo));
        statement = QUOTE([ARR_3(_player, _target, 'LUSH')] call DFUNC(updateCamo));
    };
    class Jungle:Arid {
        displayName = CSTRING(Jungle);
        condition = QUOTE([ARR_3(_player, _target, 'JUNGLE')] call DFUNC(canUpdateCamo));
        statement = QUOTE([ARR_3(_player, _target, 'JUNGLE')] call DFUNC(updateCamo));
    };
    /*
    class Strip:Arid {
        displayName = "Strip"; //CSTRING(Arid);
        condition = QUOTE([ARR_3(_player, _target, 'ARID')] call DFUNC(canUpdateCamo));
        statement = QUOTE([ARR_3(_player, _target, 'STRIPARID')] call DFUNC(updateCamo));
    };
    class StripJungle:Arid {
        displayName = "StripJungle"; //CSTRING(Arid);
        condition = QUOTE([ARR_3(_player, _target, 'JUNGLE')] call DFUNC(canUpdateCamo));
        statement = QUOTE([ARR_3(_player, _target, 'STRIPJUNGLE')] call DFUNC(updateCamo));
    };
    */
};
