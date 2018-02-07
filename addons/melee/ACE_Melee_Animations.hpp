class GVAR(Animations) {
    class GVAR(punchRifle) {
        class GVAR(directCurve) {
            animation = "MOCAP_Man_Act_Rfl_Stroke_DirectCurve";
            time = 1.7;
            delay = 1.5;
            targetAnimation = "";
            targetTime = -1;
            targetDelay = -1;
            damage = 0.30; //how to translate to ace wounds?
            distance = -1;
            damageDistance = 1.75;
            angle = 40;
            dropWeaponChance = 0.35;
            velocity = 10;
        };
        class GVAR(rightCurve): GVAR(directCurve) {
            animation = "MOCAP_Man_Act_Rfl_Stroke_RightCurve";
        };
    };

    // Knock using pistol
    class  GVAR(punchPistol) {
        class GVAR(directCurve) {
            animation = "MOCAP_Man_Act_Pstl_Stroke_RightCurve";
            time = 1.2;
            delay = 1.0;
            targetAnimation = "";
            targetTime = -1;
            targetDelay = -1;
            damage = 0.20; //how to translate to ace wounds?
            distance = -1;
            damageDistance = 1.75;
            angle = 40;
            dropWeaponChance = 0.35;
            velocity = 10;
        };
        class GVAR(leftCurve): GVAR(directCurve) {
            animation = "MOCAP_Man_Act_Pstl_Stroke_LeftCurve";
            time = 1.6;
            delay = 1.4;
        };
    };

    class  GVAR(punchLauncher) {
        class GVAR(directCurve) {
            animation = "MOCAP_Man_Act_Lnr_Stroke_DirectCurve";
            time = 1.2;
            delay = 1.0;
            targetAnimation = "";
            targetTime = -1;
            targetDelay = -1;
            damage = 0.35; //how to translate to ace wounds?
            distance = -1;
            damageDistance = 1.75;
            angle = 40;
            dropWeaponChance = 0.35;
            velocity = 10;
        };
    };
    // Knock using hands
    class  GVAR(punchNone){
        class GVAR(leftDirect) {
            animation = "MOCAP_Man_Act_Non_CivPace_Non_Punch_Hand_Left_Direct";
            time = 1.0;
            delay = 0.8;
            targetAnimation = "";
            targetTime = -1;
            targetDelay = -1;
            damage =0.30; //how to translate to ace wounds?
            distance = -1;
            damageDistance = 1.75;
            angle = 40;
            dropWeaponChance = 0.35;
            velocity = 10;
        };
        class GVAR(rightDirect): GVAR(leftDirect) {
            animation = "MOCAP_Man_Act_Non_CivPace_Non_Punch_Hand_Right_Direct";
        };
    };

    // Kick wearing rifle
    class  GVAR(kickRifle) {
        class GVAR(leftLeg) {
            animation = "MOCAP_Man_Act_Idle_Stay_CombatPace_Rfl_Push_Kick_LeftLeg";
            time = 1.0;
            delay = 1.0;
            targetAnimation = "";
            targetTime = -1;
            targetDelay = -1;
            damage = 0.15; //how to translate to ace wounds?
            distance = -1;
            damageDistance = 1.75;
            angle = 25;
            dropWeaponChance = 0.35;
            velocity = 10;
        };
    };

    // Kick wearing pistol
    class  GVAR(kickPistol) {
        class GVAR(leftLeg) {
            animation = "MOCAP_Man_Act_Idle_Stay_CombatPace_Pstl_Push_Kick_LeftLeg";
            time = 1.0;
            delay = 1.0;
            targetAnimation = "";
            targetTime = -1;
            targetDelay = -1;
            damage = 0.15; //how to translate to ace wounds?
            distance = -1;
            damageDistance = 1.75;
            angle = 25;
            dropWeaponChance = 0.35;
            velocity = 10;
        };
    };
    // Kick wearing launcher
    class  GVAR(kickLauncher) {
        class GVAR(leftLeg) {
            animation = "MOCAP_Man_Act_Idle_Stay_CombatPace_Lnr_Push_Kick_LeftLeg";
            time = 1.0;
            delay = 1.0;
            targetAnimation = "";
            targetTime = -1;
            targetDelay = -1;
            damage = 0.15; //how to translate to ace wounds?
            distance = -1;
            damageDistance = 1.75;
            angle = 25;
            dropWeaponChance = 0.35;
            velocity = 10;
        };
    };
    // Kick wearing nothing
    class  GVAR(kickNone) {
        class GVAR(leftLeg) {
            animation = "MOCAP_Man_Act_Idle_Stay_CivPace_Non_Push_Kick_LeftLeg";
            time = 1.0;
            delay = 1.0;
            targetAnimation = "";
            targetTime = -1;
            targetDelay = -1;
            damage =0.15; //how to translate to ace wounds?
            distance = -1;
            damageDistance = 1.75;
            angle = 25;
            dropWeaponChance = 0.35;
            velocity = 10;
        };
    };

    // Grab: player - stands, target - stands
    class  GVAR(grabStandStand) {
        class GVAR(default) {
            animation = "MOCAP_Man_Act_Idle_Stay_CombatPace_Un_Atacker_Grab_Naked_Choke_No_Contr";
            time = 8;
            delay = 8;
            targetAnimation = "MOCAP_Man_Act_Idle_Stay_CombatPace_Un_Prey_Grabbed_Naked_Choke_No_Contr";
            targetTime = 8;
            targetDelay = 8;
            damage = 1; //how to translate to ace wounds?
            distance = 1.75;
            damageDistance = 1.20;
            angle = 35;
            dropWeaponChance = 1;
            velocity = 0;
        };
    };
    class  GVAR(grabCrouchStand) {
        class GVAR(default) {
            animation = "MOCAP_Man_Act_Idle_Kneel_CombatPace_Un_Atacker_Grabbed_Legs_Neck_Twist_No_Contr";
            time = 4.3;
            delay = 4.3;
            targetAnimation = "MOCAP_Man_Act_Idle_Stay_CombatPace_Un_Prey_Grabbed_Legs_Neck_Twist_No_Contr";
            targetTime = 4.3;
            targetDelay = 4.3;
            damage = 1; //how to translate to ace wounds?
            distance = 1.75;
            damageDistance = 1.40;
            angle = 35;
            dropWeaponChance = 1;
            velocity = 0;
        };
    };
    class  GVAR(grabCrouchCrouch) {
        class GVAR(default) {
            animation = "MOCAP_Man_Act_Idle_Kneel_CombatPace_Un_Atacker_Grabbed_OnBack_Naked_Choke_No_Contr";
            time = 9.68;
            delay = 9.68;
            targetAnimation = "MOCAP_Man_Act_Idle_Kneel_CombatPace_Un_Prey_Grabbed_OnBack_Naked_Choke_No_Contr";
            targetTime = 9.68;
            targetDelay = 9.68;
            damage = 1; //how to translate to ace wounds?
            distance = 1.75;
            damageDistance = 1.45;
            angle = 35;
            dropWeaponChance = 1;
            velocity = 0;
        };
    };
    class  GVAR(grabStandCrouch) {
        class GVAR(default) {
            animation = "MOCAP_Man_Act_Idle_Stay_CombatPace_Un_Atacker_Grab_ByLeftLeg_Neck_Twist_No_Contr";
            time = 2.46;
            delay = 2.46;
            targetAnimation = "MOCAP_Man_Act_Idle_Kneel_CombatPace_Un_Prey_Grab_ByLeftLeg_Neck_Twist_No_Contr";
            targetTime = 2.46;
            targetDelay = 2.46;
            damage = 1; //how to translate to ace wounds?
            distance = 1.75;
            damageDistance = 0.97;
            angle = 35;
            dropWeaponChance = 1;
            velocity = 0;
        };
    };
    class  GVAR(grabCrouchProne) {
        class GVAR(default) {
            animation = "MOCAP_Man_Act_Idle_Kneel_CombatPace_Un_Atacker_Lying_Neck_Twist_No_Contr";
            time = 4.0;
            delay = 3.6;
            targetAnimation = "MOCAP_Man_Act_Idle_Prone_CivPace_Un_Prey_Lying_Neck_Twist_No_Contr";
            targetTime = 4.0;
            targetDelay = 3.6;
            damage = 1; //how to translate to ace wounds?
            distance = 1.75;
            damageDistance = 1.2;
            angle = 35;
            dropWeaponChance = 1;
            velocity = 0;
        };
    };
};
