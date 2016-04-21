<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="select_clk" />
        <signal name="CLK" />
        <signal name="XLXN_8" />
        <signal name="number_clk" />
        <signal name="digit_clk" />
        <signal name="led_en(3:0)" />
        <signal name="to_led(7:0)" />
        <signal name="digit_led(5:0)" />
        <signal name="trans_number(15:0)" />
        <signal name="digit(3:0)" />
        <signal name="A(3:0)" />
        <signal name="B(3:0)" />
        <signal name="XLXN_15(3:0)" />
        <signal name="XLXN_16(3:0)" />
        <signal name="XLXN_17(3:0)" />
        <port polarity="Output" name="select_clk" />
        <port polarity="Input" name="CLK" />
        <port polarity="Output" name="number_clk" />
        <port polarity="Output" name="digit_clk" />
        <port polarity="Output" name="led_en(3:0)" />
        <port polarity="Output" name="to_led(7:0)" />
        <port polarity="Output" name="digit_led(5:0)" />
        <port polarity="Output" name="trans_number(15:0)" />
        <port polarity="Output" name="digit(3:0)" />
        <port polarity="Input" name="A(3:0)" />
        <port polarity="Input" name="B(3:0)" />
        <blockdef name="freq_div">
            <timestamp>2016-3-14T17:21:57</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="output_unit">
            <timestamp>2016-3-14T17:54:29</timestamp>
            <rect width="336" x="64" y="-384" height="384" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="400" y="-364" height="24" />
            <line x2="464" y1="-352" y2="-352" x1="400" />
            <rect width="64" x="400" y="-284" height="24" />
            <line x2="464" y1="-272" y2="-272" x1="400" />
            <rect width="64" x="400" y="-204" height="24" />
            <line x2="464" y1="-192" y2="-192" x1="400" />
            <rect width="64" x="400" y="-124" height="24" />
            <line x2="464" y1="-112" y2="-112" x1="400" />
            <rect width="64" x="400" y="-44" height="24" />
            <line x2="464" y1="-32" y2="-32" x1="400" />
        </blockdef>
        <blockdef name="div">
            <timestamp>2016-3-24T9:45:0</timestamp>
            <rect width="256" x="64" y="-256" height="256" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-140" height="24" />
            <line x2="0" y1="-128" y2="-128" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <rect width="64" x="320" y="-172" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <block symbolname="freq_div" name="XLXI_1">
            <blockpin signalname="CLK" name="CLK" />
            <blockpin signalname="number_clk" name="freq_1" />
            <blockpin signalname="digit_clk" name="freq_2" />
            <blockpin signalname="select_clk" name="freq_3" />
        </block>
        <block symbolname="output_unit" name="XLXI_3">
            <blockpin signalname="number_clk" name="number_clk" />
            <blockpin signalname="digit_clk" name="digit_clk" />
            <blockpin signalname="XLXN_8" name="error" />
            <blockpin signalname="XLXN_15(3:0)" name="A(3:0)" />
            <blockpin signalname="XLXN_16(3:0)" name="B(3:0)" />
            <blockpin signalname="XLXN_17(3:0)" name="C(3:0)" />
            <blockpin signalname="digit(3:0)" name="digit(3:0)" />
            <blockpin signalname="led_en(3:0)" name="led_en(3:0)" />
            <blockpin signalname="to_led(7:0)" name="to_led(7:0)" />
            <blockpin signalname="digit_led(5:0)" name="digit_led(5:0)" />
            <blockpin signalname="trans_number(15:0)" name="trans_number(15:0)" />
        </block>
        <block symbolname="div" name="XLXI_4">
            <blockpin signalname="select_clk" name="CLK" />
            <blockpin signalname="A(3:0)" name="A(3:0)" />
            <blockpin signalname="B(3:0)" name="B(3:0)" />
            <blockpin signalname="XLXN_8" name="error" />
            <blockpin signalname="XLXN_15(3:0)" name="A_out(3:0)" />
            <blockpin signalname="XLXN_16(3:0)" name="B_out(3:0)" />
            <blockpin signalname="XLXN_17(3:0)" name="C(3:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="select_clk">
            <wire x2="864" y1="1168" y2="1168" x1="832" />
            <wire x2="880" y1="1168" y2="1168" x1="864" />
            <wire x2="880" y1="880" y2="880" x1="864" />
            <wire x2="864" y1="880" y2="1168" x1="864" />
        </branch>
        <branch name="CLK">
            <wire x2="448" y1="1040" y2="1040" x1="416" />
        </branch>
        <instance x="1408" y="1328" name="XLXI_3" orien="R0">
        </instance>
        <branch name="number_clk">
            <wire x2="1120" y1="1040" y2="1040" x1="832" />
            <wire x2="1280" y1="976" y2="976" x1="1120" />
            <wire x2="1408" y1="976" y2="976" x1="1280" />
            <wire x2="1120" y1="976" y2="1040" x1="1120" />
            <wire x2="1312" y1="912" y2="912" x1="1280" />
            <wire x2="1280" y1="912" y2="976" x1="1280" />
        </branch>
        <branch name="digit_clk">
            <wire x2="992" y1="1104" y2="1104" x1="832" />
            <wire x2="1136" y1="1104" y2="1104" x1="992" />
            <wire x2="1040" y1="912" y2="912" x1="992" />
            <wire x2="992" y1="912" y2="1104" x1="992" />
            <wire x2="1136" y1="1040" y2="1104" x1="1136" />
            <wire x2="1408" y1="1040" y2="1040" x1="1136" />
        </branch>
        <branch name="led_en(3:0)">
            <wire x2="1904" y1="1056" y2="1056" x1="1872" />
        </branch>
        <branch name="to_led(7:0)">
            <wire x2="1904" y1="1136" y2="1136" x1="1872" />
        </branch>
        <branch name="digit_led(5:0)">
            <wire x2="1904" y1="1216" y2="1216" x1="1872" />
        </branch>
        <branch name="trans_number(15:0)">
            <wire x2="1904" y1="1296" y2="1296" x1="1872" />
        </branch>
        <branch name="digit(3:0)">
            <wire x2="1904" y1="976" y2="976" x1="1872" />
        </branch>
        <iomarker fontsize="28" x="1904" y="976" name="digit(3:0)" orien="R0" />
        <iomarker fontsize="28" x="1904" y="1056" name="led_en(3:0)" orien="R0" />
        <iomarker fontsize="28" x="1904" y="1136" name="to_led(7:0)" orien="R0" />
        <iomarker fontsize="28" x="1904" y="1216" name="digit_led(5:0)" orien="R0" />
        <iomarker fontsize="28" x="1904" y="1296" name="trans_number(15:0)" orien="R0" />
        <iomarker fontsize="28" x="1312" y="912" name="number_clk" orien="R0" />
        <iomarker fontsize="28" x="1040" y="912" name="digit_clk" orien="R0" />
        <iomarker fontsize="28" x="880" y="880" name="select_clk" orien="R0" />
        <instance x="448" y="1200" name="XLXI_1" orien="R0">
        </instance>
        <iomarker fontsize="28" x="416" y="1040" name="CLK" orien="R180" />
        <branch name="XLXN_8">
            <wire x2="1264" y1="1104" y2="1168" x1="1264" />
            <wire x2="1408" y1="1104" y2="1104" x1="1264" />
        </branch>
        <instance x="880" y="1392" name="XLXI_4" orien="R0">
        </instance>
        <branch name="A(3:0)">
            <wire x2="880" y1="1264" y2="1264" x1="496" />
        </branch>
        <branch name="B(3:0)">
            <wire x2="880" y1="1360" y2="1360" x1="496" />
        </branch>
        <iomarker fontsize="28" x="496" y="1264" name="A(3:0)" orien="R180" />
        <iomarker fontsize="28" x="496" y="1360" name="B(3:0)" orien="R180" />
        <branch name="XLXN_15(3:0)">
            <wire x2="1328" y1="1232" y2="1232" x1="1264" />
            <wire x2="1328" y1="1168" y2="1232" x1="1328" />
            <wire x2="1408" y1="1168" y2="1168" x1="1328" />
        </branch>
        <branch name="XLXN_16(3:0)">
            <wire x2="1344" y1="1296" y2="1296" x1="1264" />
            <wire x2="1344" y1="1232" y2="1296" x1="1344" />
            <wire x2="1408" y1="1232" y2="1232" x1="1344" />
        </branch>
        <branch name="XLXN_17(3:0)">
            <wire x2="1360" y1="1360" y2="1360" x1="1264" />
            <wire x2="1360" y1="1296" y2="1360" x1="1360" />
            <wire x2="1408" y1="1296" y2="1296" x1="1360" />
        </branch>
    </sheet>
</drawing>