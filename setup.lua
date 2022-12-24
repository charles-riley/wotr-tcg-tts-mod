-- decks
promo = getObjectFromGUID("904dae")
southron = getObjectFromGUID("fbb387")
mordor = getObjectFromGUID("c8822f")
monstrous = getObjectFromGUID("a8d311")
isengard = getObjectFromGUID("9214fc")
dunedain = getObjectFromGUID("9dcae2")
dwarf = getObjectFromGUID("312d34")
elf = getObjectFromGUID("a4588d")
hobbit = getObjectFromGUID("662854")
rohan = getObjectFromGUID("27c5b8")
wizard = getObjectFromGUID("ff20a6")
shadow_battlegrounds = getObjectFromGUID("a5c0cc")
free_peoples_battlegrounds = getObjectFromGUID("4901f5")
path1 = getObjectFromGUID("67ee66")
path2 = getObjectFromGUID("516e6d")
path3 = getObjectFromGUID("0e2dd5")
path4 = getObjectFromGUID("e57422")
path5 = getObjectFromGUID("8b9c9b")
path6 = getObjectFromGUID("0f0ae8")
path7 = getObjectFromGUID("20d269")
path8 = getObjectFromGUID("43323d")
path9 = getObjectFromGUID("587f9e")

-- cards
shadow_helper = getObjectFromGUID("23c333")
free_peoples_helper = getObjectFromGUID("05f876")
turn_tracker = getObjectFromGUID("56494f")
turn_tracker_token = getObjectFromGUID("7e74fe")

-- rings
witch_king_ring = getObjectFromGUID("3ea385")
saruman_ring = getObjectFromGUID("b47492")
aragorn_ring = getObjectFromGUID("b5aa21")
frodo_ring = getObjectFromGUID("076e4f")

-- other
trash = getObjectFromGUID("c01b96")

-- positions
yellow_exiled = Vector(-32.064629, 0.973605, -20.743591)
yellow_draw = Vector(-22.148804, 0.973605, -20.757271)
yellow_cycled = Vector(-11.9866, 0.973605, -20.703468)
brown_exiled = Vector(10.853039, 0.973605, -20.804123)
brown_draw = Vector(21.200584, 0.973605, -20.750433)
brown_cycled = Vector(31.757725, 0.973605, -20.765505)
blue_exiled = Vector(31.916193, 0.973605, 20.758022)
blue_draw = Vector(21.394684, 0.973605, 20.772974)
blue_cycled = Vector(11.280308, 0.973605, 20.787186)
teal_exiled = Vector(-11.457415, 0.973605, 20.819462)
teal_draw = Vector(-21.845392, 0.973605, 20.834047)
teal_cycled = Vector(-32.10688, 0.973605, 20.84865)
--shadow_helper_pos = Vector(0, 0.974822, -32)
shadow_helper_pos = Vector(0, 3.76, -32)
free_peoples_helper_pos = Vector(0, 0.974822, 31.999998)
path_pos = Vector(50, 0.99659, 0)
witch_king_ring_pos = Vector(24, 0.96, -28)
saruman_ring_pos = Vector(-24, 0.96, -28)
frodo_ring_pos = Vector(-24, 0.96, 28)
aragorn_ring_pos = Vector(24, 0.96, 28)
turn_tracker_token_pos = Vector(-52, 10, 2)

-- rotations
turn_tracker_rot = Vector(0, 90, 180)

function setScenario(player, option, id) 
    scenario = option
end

function setIncludePromo(player, option, id)
    include_promo = option
end

function setUpGame()
    if scenario == nil then scenario = "Trilogy" end

    if include_promo == nil then include_promo = self.UI.getAttribute("include_promo", "isOn") end

    if scenario == "Trilogy" then set_up_trilogy() end

    if scenario == "2 Player Duel" then set_up_2_player_duel() end

    if scenario == "3 Player Duel" then set_up_3_player_duel() end
    
    destroyObject(self)
end

function set_up_promo()
    mordor.putObject(promo.takeObject())
    monstrous.putObject(promo.takeObject())
    rohan.putObject(promo.takeObject())
    dunedain.putObject(promo.takeObject())
end

function set_up_trilogy()
    

    -- witch king
    mordor.setPosition(brown_draw)
    mordor.setRotation(Vector(0,180,180)) 
    if include_promo == "true" then mordor.putObject(promo.takeObject()) else trash.putObject(promo.takeObject()) end   
    mordor.randomize()
    mordor.deal(7, "Brown")
    witch_king_ring.setPosition(witch_king_ring_pos)

    -- saruman
    isengard.setPosition(yellow_draw)
    isengard.setRotation(Vector(0,180,180))
    for i = 1, 7 do
        isengard.putObject(southron.takeObject())
    end
    for i = 1, 11 do
        isengard.putObject(monstrous.takeObject())
    end
    if include_promo == "true" then isengard.putObject(promo.takeObject()) else trash.putObject(promo.takeObject()) end   
    isengard.randomize()
    isengard.deal(7, "Yellow")
    saruman_ring.setPosition(saruman_ring_pos)


    -- shadow helper
    shadow_helper.setPosition(shadow_helper_pos)
    shadow_helper.setRotation(Vector(0,90,0))

    -- shadow battlegrounds
    shadow_battlegrounds.randomize()

    -- frodo
    hobbit.setPosition(teal_draw)
    hobbit.setRotation(Vector(0,0,180))
    for i = 1, 2 do
        hobbit.putObject(dwarf.takeObject())
    end 
    for i = 1, 8 do
        hobbit.putObject(rohan.takeObject())
    end
    for i = 1, 10 do
        hobbit.putObject(wizard.takeObject())
    end
    if include_promo == "true" then hobbit.putObject(promo.takeObject()) else trash.putObject(promo.takeObject()) end   
    hobbit.randomize()
    hobbit.deal(7, "Teal")
    frodo_ring.setPosition(frodo_ring_pos)

    -- aragorn
    dunedain.setPosition(blue_draw)
    dunedain.setRotation(Vector(0,0,180))
    for i = 1, 9 do
        dunedain.putObject(elf.takeObject())
    end
    if include_promo == "true" then dunedain.putObject(promo.takeObject()) else trash.putObject(promo.takeObject()) end   
    dunedain.randomize()
    dunedain.deal(7, "Blue")
    aragorn_ring.setPosition(aragorn_ring_pos)

    -- free peoples helper
    free_peoples_helper.setPosition(free_peoples_helper_pos)
    free_peoples_helper.setRotation(Vector(0,-90,0))    

    -- free peoples battlegrounds
    free_peoples_battlegrounds.randomize()

    -- paths
    path9.randomize()
    path9.setPosition(path_pos)
    path8.randomize()
    for i = 1, 3 do
        path8.takeObject({ position = path_pos + Vector(0, 1, 0), smooth = true })
    end
    path7.randomize()
    for i = 1, 3 do 
        path7.takeObject({ position = path_pos + Vector(0, 2, 0), smooth = true })
    end
    path6.randomize()
    for i = 1, 3 do 
        path6.takeObject({ position = path_pos + Vector(0, 3, 0), smooth = true })
    end
    path5.randomize()
    for i = 1, 3 do 
        path5.takeObject({ position = path_pos + Vector(0, 4, 0), smooth = true })
    end
    path4.randomize()
    for i = 1, 3 do 
        path4.takeObject({ position = path_pos + Vector(0, 5, 0), smooth = true })
    end
    path3.randomize()
    for i = 1, 3 do 
        path3.takeObject({ position = path_pos + Vector(0, 6, 0), smooth = true })
    end
    path2.randomize()
    for i = 1, 3 do 
        path2.takeObject({ position = path_pos + Vector(0, 7, 0), smooth = true })
    end
    path1.randomize()
    path1.setPosition(Vector(-50, 1 ,0))
    for i = 1, 3 do 
        path1.takeObject({ position = path_pos + Vector(0, 8, 0), smooth = true })
    end
 
end

function set_up_2_player_duel()
    -- witch king
    mordor.setPosition(brown_draw)
    mordor.setRotation(Vector(0,180,180))
    for i = 1, 7 do
        mordor.putObject(southron.takeObject())
    end
    for i = 1, 11 do
        mordor.putObject(monstrous.takeObject())
    end
    for i =1, 12 do
        mordor.putObject(isengard.takeObject())
    end
    if include_promo == "true" then mordor.putObject(promo.takeObject()) else trash.putObject(promo.takeObject()) end   
    if include_promo == "true" then mordor.putObject(promo.takeObject()) else trash.putObject(promo.takeObject()) end   
    mordor.randomize()
    mordor.deal(6, "Brown")
    witch_king_ring.setPosition(witch_king_ring_pos)
    trash.putObject(saruman_ring)

    -- shadow helper
    shadow_helper.setPosition(shadow_helper_pos)
    shadow_helper.setRotation(Vector(0,90,180))

    -- shadow battlegrounds
    shadow_battlegrounds.randomize()

    -- gandalf
    wizard.setPosition(blue_draw)
    wizard.setRotation(Vector(0,0,180))
    for i = 1, 9 do
        wizard.putObject(elf.takeObject())
    end
    for i = 1, 2 do
        wizard.putObject(dwarf.takeObject())
    end 
    for i = 1, 8 do
        wizard.putObject(rohan.takeObject())
    end
    for i = 1, 21 do
        wizard.putObject(dunedain.takeObject())
    end
    for i = 1, 10 do
        wizard.putObject(hobbit.takeObject())
    end
    if include_promo == "true" then wizard.putObject(promo.takeObject()) else trash.putObject(promo.takeObject()) end   
    if include_promo == "true" then wizard.putObject(promo.takeObject()) else trash.putObject(promo.takeObject()) end   
    wizard.randomize()
    wizard.deal(4, "Blue")
    aragorn_ring.setPosition(aragorn_ring_pos)
    trash.putObject(frodo_ring) 

    -- free peoples helper
    free_peoples_helper.setPosition(free_peoples_helper_pos)
    free_peoples_helper.setRotation(Vector(0,270,180))    

    -- free peoples battlegrounds
    free_peoples_battlegrounds.randomize()

    -- paths
    path9.randomize()
    path9.setPosition(path_pos)
    path8.randomize()
    for i = 1, 3 do
        path8.takeObject({ position = path_pos + Vector(0, 1, 0), smooth = true })
    end
    path7.randomize()
    for i = 1, 3 do 
        path7.takeObject({ position = path_pos + Vector(0, 2, 0), smooth = true })
    end
    path6.randomize()
    for i = 1, 3 do 
        path6.takeObject({ position = path_pos + Vector(0, 3, 0), smooth = true })
    end
    path5.randomize()
    for i = 1, 3 do 
        path5.takeObject({ position = path_pos + Vector(0, 4, 0), smooth = true })
    end
    path4.randomize()
    for i = 1, 3 do 
        path4.takeObject({ position = path_pos + Vector(0, 5, 0), smooth = true })
    end
    path3.randomize()
    for i = 1, 3 do 
        path3.takeObject({ position = path_pos + Vector(0, 6, 0), smooth = true })
    end
    path2.randomize()
    for i = 1, 3 do 
        path2.takeObject({ position = path_pos + Vector(0, 7, 0), smooth = true })
    end
    path1.randomize()
    path1.setPosition(Vector(-50, 1 ,0))
    for i = 1, 3 do 
        path1.takeObject({ position = path_pos + Vector(0, 8, 0), smooth = true })
    end

    -- turn tracker
    turn_tracker_token.setPosition(turn_tracker_token_pos)
    turn_tracker.setRotation(turn_tracker_rot)
end

function set_up_3_player_duel()

    -- witch king
    mordor.setPosition(brown_draw)
    mordor.setRotation(Vector(0,180,180)) 
    if include_promo == "true" then mordor.putObject(promo.takeObject())  else trash.putObject(promo.takeObject()) end   
    mordor.randomize()
    mordor.deal(7, "Brown")
    witch_king_ring.setPosition(witch_king_ring_pos)

    -- saruman
    isengard.setPosition(yellow_draw)
    isengard.setRotation(Vector(0,180,180))
    for i = 1, 7 do
        isengard.putObject(southron.takeObject())
    end
    for i = 1, 11 do
        isengard.putObject(monstrous.takeObject())
    end
    if include_promo == "true" then isengard.putObject(promo.takeObject())  else trash.putObject(promo.takeObject())  end   
    isengard.randomize()
    isengard.deal(7, "Yellow")
    saruman_ring.setPosition(saruman_ring_pos)

    -- shadow helper
    shadow_helper.setPosition(shadow_helper_pos)
    shadow_helper.setRotation(Vector(0,90,180))

    -- shadow battlegrounds
    shadow_battlegrounds.randomize()

    -- gandalf
    wizard.setPosition(blue_draw)
    wizard.setRotation(Vector(0,0,180))
    for i = 1, 9 do
        wizard.putObject(elf.takeObject())
    end
    for i = 1, 2 do
        wizard.putObject(dwarf.takeObject())
    end 
    for i = 1, 8 do
        wizard.putObject(rohan.takeObject())
    end
    for i = 1, 21 do
        wizard.putObject(dunedain.takeObject())
    end
    for i = 1, 10 do
        wizard.putObject(hobbit.takeObject())
    end
    if include_promo == "true" then wizard.putObject(promo.takeObject())  else trash.putObject(promo.takeObject()) end   
    if include_promo == "true" then wizard.putObject(promo.takeObject())  else trash.putObject(promo.takeObject()) end   
    wizard.randomize()
    wizard.deal(6, "Blue")
    aragorn_ring.setPosition(aragorn_ring_pos)
    trash.putObject(frodo_ring) 

    -- free peoples helper
    free_peoples_helper.setPosition(free_peoples_helper_pos)
    free_peoples_helper.setRotation(Vector(0,270,180))    

    -- free peoples battlegrounds
    free_peoples_battlegrounds.randomize()

    -- paths
    path9.randomize()
    path9.setPosition(path_pos)
    path8.randomize()
    for i = 1, 3 do
        path8.takeObject({ position = path_pos + Vector(0, 1, 0), smooth = true })
    end
    path7.randomize()
    for i = 1, 3 do 
        path7.takeObject({ position = path_pos + Vector(0, 2, 0), smooth = true })
    end
    path6.randomize()
    for i = 1, 3 do 
        path6.takeObject({ position = path_pos + Vector(0, 3, 0), smooth = true })
    end
    path5.randomize()
    for i = 1, 3 do 
        path5.takeObject({ position = path_pos + Vector(0, 4, 0), smooth = true })
    end
    path4.randomize()
    for i = 1, 3 do 
        path4.takeObject({ position = path_pos + Vector(0, 5, 0), smooth = true })
    end
    path3.randomize()
    for i = 1, 3 do 
        path3.takeObject({ position = path_pos + Vector(0, 6, 0), smooth = true })
    end
    path2.randomize()
    for i = 1, 3 do 
        path2.takeObject({ position = path_pos + Vector(0, 7, 0), smooth = true })
    end
    path1.randomize()
    path1.setPosition(Vector(-50, 1 ,0))
    for i = 1, 3 do 
        path1.takeObject({ position = path_pos + Vector(0, 8, 0), smooth = true })
    end

    -- turn tracker
    turn_tracker_token.setPosition(turn_tracker_token_pos)
    turn_tracker.setRotation(turn_tracker_rot)
end