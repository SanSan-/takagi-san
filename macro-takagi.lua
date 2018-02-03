--[[
]]

include("karaskel.lua");


script_name = "Spined Takagi Clower"
script_author = "Alex SanSan Franz"
script_description = "..."
script_version = "1.0"


takagi = {}
takagi.subtitles = nil
takagi.selected_lines = nil
takagi.active_line = nil
takagi.meta = nil
takagi.styles = nil
takagi.line_numbers = {}
takagi.config = {
    corolla_scale = 35
}
takagi.corollas = {
    "m 36 54 b 33 27 18 17 11 11 -1 1 -9 3 -4 17 -1 29 4 35 10 44 18 52 23 57 36 62",
    "m 68 71 b 80 62 104 60 122 66 143 71 139 84 121 86 102 88 80 84 69 73",
    "m 30 85 b 16 88 4 97 -1 111 -5 127 2 131 16 121 25 113 33 99 31 88",
    "m 38 65 b 45 66 51 62 54 58 64 50 52 38 41 48 35 56 35 59 36 63",
    "m 33 77 b 51 77 58 83 59 92 61 105 47 105 42 102 35 99 31 91 32 78",
    "m 26 70 b 21 65 15 60 6 64 1 68 1 73 7 78 14 79 20 80 26 72"
}
takagi.dialog = {
    {
        class = "label",
        x = 0,
        y = 0,
        height = 1,
        width = 5,
        label = "Cofiguration"
    },
    {
        class = "label",
        x = 0,
        y = 1,
        height = 1,
        width = 1,
        label = "Apply to style"
    },
    {
        class = "dropdown",
        x = 1,
        y = 1,
        height = 1,
        width = 4,
        name = "style_name",
        hint = "Pilih style yang akan di apply",
        items = {},
        value = ""
    },
    {
        class = "label",
        x = 0,
        y = 2,
        height = 1,
        width = 1,
        label = "Corolla scale"
    },
    {
        class = "intedit",
        x = 1,
        y = 2,
        height = 1,
        width = 3,
        name = "corolla_scale",
        hint = "Scale of flower's corrola (0 - 1000)",
        min = 0,
        max = 1000,
        value = 100
    },
    {
        class = "label",
        x = 4,
        y = 2,
        height = 1,
        width = 1,
        label = "%"
    }
}


function takagi:prepare_dialog()
    local conf = self.config
    local styles = self.styles
    local style_dialog = self.dialog[3]

    style_dialog.items = {}
    style_dialog.value = ""

    local maxi = #styles
    if maxi > 0 then
        style_dialog.value = styles[1].name

        for i = 1, maxi do
            local style_name = styles[i].name

            table.insert(style_dialog.items, style_name)

            if style_name == conf.style_name then
                style_dialog.value = conf.style_name
            end
        end
    end


    self.dialog[5].value = conf.corolla_scale
end

function takagi:update_line_info(line)
    local subs = self.subtitles
    local meta = self.meta
    local styles = self.styles

    karaskel.preproc_line(subs, meta, styles, line)
    karaskel.preproc_line_size(meta, styles, line)
    karaskel.preproc_line_pos(meta, styles, line)
end

function takagi:process()

    aegisub.progress.task("waiting configuration");
    local btn, conf = aegisub.dialog.display(self.dialog)

    if btn then
        self.config = conf

        self:prepare_lines()

        self:build_kara()

        aegisub.progress.task("Finished!")
        aegisub.progress.set(100)

        aegisub.set_undo_point("Apply IOPC Automation")
    else
        aegisub.progress.task("Canceled!");
    end
end

function takagi:prepare_lines()
    local conf = self.config
    local meta, styles = self.meta, self.styles
    local subs = self.subtitles;
    local line_numbers = {}

    local i = 1
    while i <= #subs do
        local subtitle = subs[i];
        if subtitle.class == "dialogue" and subtitle.style == conf.style_name then
            if subtitle.effect == "fx" then
                subs.delete(i);
                i = i - 1;
            else
                table.insert(line_numbers, i)
            end
        end

        i = i + 1;
    end

    self.line_numbers = line_numbers
end

function takagi:build_kara()
    local line_numbers = self.line_numbers
    local subs = self.subtitles

    local maxi = #line_numbers
    for i = 1, maxi do
        local num = line_numbers[i]
        local line = subs[num]

        self:update_line_info(line)

        self:kara_build_shadow(subs, line, 0, self.config.corolla_scale * 1.25)
        self:kara_build_flower(subs, line, 0, self.config.corolla_scale)
        self:kara_build_pollen(subs, line, 0)
        self:kara_build_syl(subs, line, 0)

        line.comment = true
        line.effect = "Karaoke"
        subs[num] = line
    end
end



function takagi:kara_build_shadow(subs, line, layer, scale)

    local text_format = table.concat({
        "{\\an5\\1a&HFF&\\3c%s",
        "\\bord4\\be1\\3a&H99&",
        "\\pos(%f,%f)",
        "\\t(%d,%d,\\alpha&HFF&)",
        "\\fscx%d\\fscy%d",
        "\\p1}%s{\\p0}"
    }, "")

    for i, syl in ipairs(line.kara) do
        local l = table.copy(line)

        l.effect = "fx"
        l.comment = false
        l.layer = layer
        l.start_time = line.start_time + syl.start_time
        l.end_time = l.start_time + syl.duration + 750
        l.duration = l.end_time - l.start_time

        local pos_x = line.left + syl.center
        local pos_y = line.middle

        for i, corolla in ipairs(self.corollas) do

            l.text = text_format:format(color_from_style(syl.style.color4),
                pos_x-10, pos_y-25,
                l.duration - 150 * i, l.duration,
                scale, scale,
                corolla)

            subs.append(l)
        end
    end
end

function takagi:kara_build_flower(subs, line, layer, scale)

    local text_format = table.concat({
        "{\\an5\\be1\\bord0.1\\3c&H000000&\\3a&HAA&\\fscx%d\\fscy%d\\1c%s",
        "\\move(%d,%d,%d,%d,%d,%d)",
        "\\t(%d,%d,\\frx%d\\fry%d\\frz%d)",
        "\\t(%d,%d,\\alpha&HFF&)",
        "\\p1}%s{\\p0}"
    }, "")


    for i, syl in ipairs(line.kara) do
        local l = table.copy(line)
        l.effect = "fx"
        l.comment = false
        l.layer = layer

        for i, corolla in ipairs(self.corollas) do

            l.start_time = line.start_time + syl.start_time - 10 * i
            l.end_time = l.start_time + syl.duration + 750
            l.duration = l.end_time - l.start_time

            local movex1 = line.left + syl.center
            local movey1 = line.middle
            local movex2 = math.random(line.left + syl.left, line.left + syl.right)
            local movey2 = movey1 - line.height


            local movet1 = l.duration - 750
            local movet2 = l.duration

            l.text = text_format:format(scale, scale, color_from_style(syl.style.color2),
                movex1, movey1, movex2, movey2, l.duration - 750, l.duration,
                movet1, movet2, math.random(-120, 120), math.random(-180, 180), math.random(-180, 180),
                l.duration - 200, movet2,
                corolla)

            subs.append(l)
        end
    end
end

function takagi:kara_build_pollen(subs, line, layer)

    local vector = "m 0 0 l 0 1 l 1 1 l 1 0 l 0 0"
    local text_format = table.concat({
        "{\\an5\\shad0\\bord%f\\be1\\1c%s\\3c%s\\3a&H55&",
        "\\move(%d,%d,%d,%d,%d,%d)",
        "\\fscx%d\\fscx%d",
        "\\p1}%s{\\p0}"
    }, "")

    for i, syl in ipairs(line.kara) do
        local l = table.copy(line)
        l.effect = "fx"
        l.comment = false
        l.layer = layer
        l.start_time = line.start_time + syl.start_time
        l.end_time = l.start_time + syl.duration + 750
        l.duration = l.end_time - l.start_time

        local fsc = math.random(100, 500)
        local color = color_from_style(syl.style.color1)

        for j = 1, math.random(4, 8) do

            local movex1 = line.left + syl.center + math.random(-1, 1)
            local movey1 = line.middle + math.random(-1, 1)

            local movex2 = math.random(line.left + syl.left, line.left + syl.right)
            local movey2 = movey1 - line.height * 0.5


            l.text = text_format:format(math.random(0.1, 1), color, color,
                movex1, movey1, movex2, movey2, l.duration - 750, l.duration,
                fsc, fsc,
                vector)
            subs.append(l)
        end
    end
end

function takagi:kara_build_syl(subs, line, layer)

    local text_format = table.concat({
        "{\\an5\\pos(%d,%d)\\1c%s\\fscx100\\fscy100",
        "\\t(%d,%d,\\1c%s\\3c%s\\3a&H10&\\bord3\\be1\\fscx137\\fscy137)",
        "\\t(%d,%d,\\1a&HFF&\\bord1\\be0\\3c%s\\fscx112\\fscy112)",
        "}%s"
    }, "")

    for i, syl in ipairs(line.kara) do
        local l = table.copy(line)
        l.effect = "fx"
        l.comment = false
        l.layer = layer

        local pos_x = line.left + syl.center
        local pos_y = line.middle

        local smid = syl.duration * 0.5

        local st1 = syl.start_time
        local st2 = st1 + smid

        local et1 = st2
        local et2 = st2 + smid


        l.text = text_format:format(
            pos_x, pos_y, color_from_style(syl.style.color2),
            st1, st2, color_from_style(syl.style.color1), color_from_style(syl.style.color3),
            et1, et2,
            color_from_style(syl.style.color1),
            syl.text)
        subs.append(l)
    end
end


function takagi:initialize(subtitles, selected_lines, active_line)

    self.subtitles = subtitles
    self.selected_lines = selected_lines
    self.active_line = active_line

    self.meta, self.styles = karaskel.collect_head(subtitles)


    self:prepare_dialog()
end


function takagi_process_macro(subtitles, selected_lines, active_line)
    takagi:initialize(subtitles, selected_lines, active_line)
    takagi:process()
end


aegisub.register_macro("Spined Takagi Clower", "SanSan ArtWorks™ Present", takagi_process_macro)