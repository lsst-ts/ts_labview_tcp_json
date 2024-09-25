<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="18008000">
	<Property Name="NI.LV.All.SourceOnly" Type="Bool">true</Property>
	<Property Name="NI.Project.Description" Type="Str"></Property>
	<Item Name="My Computer" Type="My Computer">
		<Property Name="NI.SortType" Type="Int">3</Property>
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="tests" Type="Folder">
			<Item Name="FactoryTcpServer" Type="Folder">
				<Item Name="testCase" Type="Folder">
					<Item Name="testCreateTcpServer.vi" Type="VI" URL="../../tests/FactoryTcpServer/testCase/testCreateTcpServer.vi"/>
				</Item>
				<Item Name="testFactoryTcpServer.vi" Type="VI" URL="../../tests/FactoryTcpServer/testFactoryTcpServer.vi"/>
			</Item>
			<Item Name="TcpServerBase" Type="Folder">
				<Item Name="testCase" Type="Folder">
					<Item Name="testCheckInputAndBroadcast.vi" Type="VI" URL="../../tests/TcpServerBase/testCase/testCheckInputAndBroadcast.vi"/>
					<Item Name="testCheckListOfRegMsg.vi" Type="VI" URL="../../tests/TcpServerBase/testCase/testCheckListOfRegMsg.vi"/>
					<Item Name="testFlushQueueTcpClient.vi" Type="VI" URL="../../tests/TcpServerBase/testCase/testFlushQueueTcpClient.vi"/>
					<Item Name="testGetNotifierServerStatus_base.vi" Type="VI" URL="../../tests/TcpServerBase/testCase/testGetNotifierServerStatus_base.vi"/>
					<Item Name="testMsgDetailsToJSON.vi" Type="VI" URL="../../tests/TcpServerBase/testCase/testMsgDetailsToJSON.vi"/>
					<Item Name="testSendServerNotification.vi" Type="VI" URL="../../tests/TcpServerBase/testCase/testSendServerNotification.vi"/>
					<Item Name="testClearErrorAndSendExplanation.vi" Type="VI" URL="../../tests/TcpServerBase/testCase/testClearErrorAndSendExplanation.vi"/>
				</Item>
				<Item Name="testTcpServerBase.vi" Type="VI" URL="../../tests/TcpServerBase/testTcpServerBase.vi"/>
			</Item>
			<Item Name="TcpServerCmd" Type="Folder">
				<Item Name="testCase" Type="Folder">
					<Item Name="testProcessCmd.vi" Type="VI" URL="../../tests/TcpServerCmd/testCase/testProcessCmd.vi"/>
					<Item Name="testProcessEvt.vi" Type="VI" URL="../../tests/TcpServerCmd/testCase/testProcessEvt.vi"/>
					<Item Name="testRegUserEvent.vi" Type="VI" URL="../../tests/TcpServerCmd/testCase/testRegUserEvent.vi"/>
				</Item>
				<Item Name="testTcpServerCmd.vi" Type="VI" URL="../../tests/TcpServerCmd/testTcpServerCmd.vi"/>
			</Item>
			<Item Name="TcpServerTel" Type="Folder">
				<Item Name="testCase" Type="Folder">
					<Item Name="testCheckQueueFull_TcpClientFromDds.vi" Type="VI" URL="../../tests/TcpServerTel/testCase/testCheckQueueFull_TcpClientFromDds.vi"/>
					<Item Name="testCheckQueueToDdsFull.vi" Type="VI" URL="../../tests/TcpServerTel/testCase/testCheckQueueToDdsFull.vi"/>
					<Item Name="testFlushTelFromDds.vi" Type="VI" URL="../../tests/TcpServerTel/testCase/testFlushTelFromDds.vi"/>
					<Item Name="testFlushTelToDds.vi" Type="VI" URL="../../tests/TcpServerTel/testCase/testFlushTelToDds.vi"/>
					<Item Name="testGetTel.vi" Type="VI" URL="../../tests/TcpServerTel/testCase/testGetTel.vi"/>
					<Item Name="testTcpServerTel.vi" Type="VI" URL="../../tests/TcpServerTel/testTcpServerTel.vi"/>
					<Item Name="testTelToClient.vi" Type="VI" URL="../../tests/TcpServerTel/testCase/testTelToClient.vi"/>
				</Item>
			</Item>
			<Item Name="TcpServer" Type="Folder">
				<Item Name="testCase" Type="Folder">
					<Item Name="testConfigServer.vi" Type="VI" URL="../../tests/TcpServer/testCase/testConfigServer.vi"/>
					<Item Name="testFlushTelQueueFromDds.vi" Type="VI" URL="../../tests/TcpServer/testCase/testFlushTelQueueFromDds.vi"/>
					<Item Name="testFlushTelQueueToDds.vi" Type="VI" URL="../../tests/TcpServer/testCase/testFlushTelQueueToDds.vi"/>
					<Item Name="testGetInstanceCmd.vi" Type="VI" URL="../../tests/TcpServer/testCase/testGetInstanceCmd.vi"/>
					<Item Name="testGetInstanceEvt.vi" Type="VI" URL="../../tests/TcpServer/testCase/testGetInstanceEvt.vi"/>
					<Item Name="testGetInstanceGen.vi" Type="VI" URL="../../tests/TcpServer/testCase/testGetInstanceGen.vi"/>
					<Item Name="testGetTelElement.vi" Type="VI" URL="../../tests/TcpServer/testCase/testGetTelElement.vi"/>
					<Item Name="testIsTelQueueToDdsFull.vi" Type="VI" URL="../../tests/TcpServer/testCase/testIsTelQueueToDdsFull.vi"/>
					<Item Name="testIsQueueTcpClientFromDdsFull.vi" Type="VI" URL="../../tests/TcpServer/testCase/testIsQueueTcpClientFromDdsFull.vi"/>
					<Item Name="testRegCmd.vi" Type="VI" URL="../../tests/TcpServer/testCase/testRegCmd.vi"/>
					<Item Name="testRegEvt.vi" Type="VI" URL="../../tests/TcpServer/testCase/testRegEvt.vi"/>
					<Item Name="testRegTel.vi" Type="VI" URL="../../tests/TcpServer/testCase/testRegTel.vi"/>
					<Item Name="testReadNotifierServerStatus_cmd.vi" Type="VI" URL="../../tests/TcpServer/testCase/testReadNotifierServerStatus_cmd.vi"/>
					<Item Name="testReadNotifierServerStatus_tel.vi" Type="VI" URL="../../tests/TcpServer/testCase/testReadNotifierServerStatus_tel.vi"/>
					<Item Name="testSendCmdStatus.vi" Type="VI" URL="../../tests/TcpServer/testCase/testSendCmdStatus.vi"/>
					<Item Name="testSendEvt.vi" Type="VI" URL="../../tests/TcpServer/testCase/testSendEvt.vi"/>
					<Item Name="testSendTel.vi" Type="VI" URL="../../tests/TcpServer/testCase/testSendTel.vi"/>
					<Item Name="testStopServer.vi" Type="VI" URL="../../tests/TcpServer/testCase/testStopServer.vi"/>
				</Item>
				<Item Name="testTcpServer.vi" Type="VI" URL="../../tests/TcpServer/testTcpServer.vi"/>
			</Item>
			<Item Name="Utility" Type="Folder">
				<Item Name="keyValuePair" Type="Folder">
					<Item Name="testCase" Type="Folder">
						<Item Name="testConvertToKeyValuePair.vi" Type="VI" URL="../../tests/Utility/keyValuePair/testCase/testConvertToKeyValuePair.vi"/>
						<Item Name="testDoubleArrayToStringWithBrackets.vi" Type="VI" URL="../../tests/Utility/keyValuePair/testCase/testDoubleArrayToStringWithBrackets.vi"/>
						<Item Name="testStringArrayToStringWithBrackets.vi" Type="VI" URL="../../tests/Utility/keyValuePair/testCase/testStringArrayToStringWithBrackets.vi"/>
						<Item Name="testConvertToKeyValuePairWithJSON.vi" Type="VI" URL="../../tests/Utility/keyValuePair/testCase/testConvertToKeyValuePairWithJSON.vi"/>
					</Item>
				</Item>
				<Item Name="testUtility.vi" Type="VI" URL="../../tests/Utility/testUtility.vi"/>
			</Item>
			<Item Name="simulator" Type="Folder">
				<Item Name="configFile" Type="Folder">
					<Item Name="testCase" Type="Folder">
						<Item Name="testCreateConfigFilePath.vi" Type="VI" URL="../../tests/simulator/configFile/testCase/testCreateConfigFilePath.vi"/>
						<Item Name="testReadKeysFromConfigFile.vi" Type="VI" URL="../../tests/simulator/configFile/testCase/testReadKeysFromConfigFile.vi"/>
					</Item>
				</Item>
				<Item Name="testSimulator.vi" Type="VI" URL="../../tests/simulator/testSimulator.vi"/>
			</Item>
			<Item Name="IntegrationTest" Type="Folder">
				<Item Name="testCase" Type="Folder">
					<Item Name="testConnectDisconnect.vi" Type="VI" URL="../../tests/IntegrationTest/testCase/testConnectDisconnect.vi"/>
					<Item Name="testSendCmdFromClient.vi" Type="VI" URL="../../tests/IntegrationTest/testCase/testSendCmdFromClient.vi"/>
					<Item Name="testSendEvtFromClient.vi" Type="VI" URL="../../tests/IntegrationTest/testCase/testSendEvtFromClient.vi"/>
					<Item Name="testSendEvtToClient.vi" Type="VI" URL="../../tests/IntegrationTest/testCase/testSendEvtToClient.vi"/>
					<Item Name="testSendTelToClient.vi" Type="VI" URL="../../tests/IntegrationTest/testCase/testSendTelToClient.vi"/>
					<Item Name="testSendTelFromClient.vi" Type="VI" URL="../../tests/IntegrationTest/testCase/testSendTelFromClient.vi"/>
					<Item Name="testSendTelAndCmdFromClient.vi" Type="VI" URL="../../tests/IntegrationTest/testCase/testSendTelAndCmdFromClient.vi"/>
					<Item Name="testSendTelToClientAndCmdToServer.vi" Type="VI" URL="../../tests/IntegrationTest/testCase/testSendTelToClientAndCmdToServer.vi"/>
					<Item Name="testTelPacketsSentFromTcpClient.vi" Type="VI" URL="../../tests/IntegrationTest/testCase/testTelPacketsSentFromTcpClient.vi"/>
					<Item Name="testTelPacketsSentFromTcpServer.vi" Type="VI" URL="../../tests/IntegrationTest/testCase/testTelPacketsSentFromTcpServer.vi"/>
				</Item>
				<Item Name="integrationTest.vi" Type="VI" URL="../../tests/IntegrationTest/integrationTest.vi"/>
				<Item Name="connectTcpClients.vi" Type="VI" URL="../../tests/IntegrationTest/connectTcpClients.vi"/>
				<Item Name="disconnectTcpClients.vi" Type="VI" URL="../../tests/IntegrationTest/disconnectTcpClients.vi"/>
				<Item Name="removeEmptyStrings.vi" Type="VI" URL="../../tests/IntegrationTest/removeEmptyStrings.vi"/>
				<Item Name="readTcpPackets.vi" Type="VI" URL="../../tests/IntegrationTest/readTcpPackets.vi"/>
				<Item Name="sendAndReadTelemetry.vi" Type="VI" URL="../../tests/IntegrationTest/sendAndReadTelemetry.vi"/>
				<Item Name="sendTelFromTcpClientAndGetTelemetry.vi" Type="VI" URL="../../tests/IntegrationTest/sendTelFromTcpClientAndGetTelemetry.vi"/>
				<Item Name="startTcpServer.vi" Type="VI" URL="../../tests/IntegrationTest/startTcpServer.vi"/>
			</Item>
			<Item Name="ServerInstancesTest" Type="Folder">
				<Item Name="testCase" Type="Folder">
					<Item Name="testConfigServersAandB.vi" Type="VI" URL="../../tests/ServerInstancesTest/testCase/testConfigServersAandB.vi"/>
					<Item Name="testCreateTcpIpConnectionServersAandB.vi" Type="VI" URL="../../tests/ServerInstancesTest/testCase/testCreateTcpIpConnectionServersAandB.vi"/>
					<Item Name="testCreateMultipleTcpIpConnectionsServersAandB.vi" Type="VI" URL="../../tests/ServerInstancesTest/testCase/testCreateMultipleTcpIpConnectionsServersAandB.vi"/>
					<Item Name="testGetInstanceGenServersAandB.vi" Type="VI" URL="../../tests/ServerInstancesTest/testCase/testGetInstanceGenServersAandB.vi"/>
					<Item Name="testRegCmdServersAandB.vi" Type="VI" URL="../../tests/ServerInstancesTest/testCase/testRegCmdServersAandB.vi"/>
					<Item Name="testRegEvtServersAandB.vi" Type="VI" URL="../../tests/ServerInstancesTest/testCase/testRegEvtServersAandB.vi"/>
					<Item Name="testRegTelServersAandB.vi" Type="VI" URL="../../tests/ServerInstancesTest/testCase/testRegTelServersAandB.vi"/>
					<Item Name="testSendCmdStatusServersAandB.vi" Type="VI" URL="../../tests/ServerInstancesTest/testCase/testSendCmdStatusServersAandB.vi"/>
					<Item Name="testSendEvtServersAandB.vi" Type="VI" URL="../../tests/ServerInstancesTest/testCase/testSendEvtServersAandB.vi"/>
					<Item Name="testSendTelServersAandB.vi" Type="VI" URL="../../tests/ServerInstancesTest/testCase/testSendTelServersAandB.vi"/>
					<Item Name="testStopServersAandB.vi" Type="VI" URL="../../tests/ServerInstancesTest/testCase/testStopServersAandB.vi"/>
					<Item Name="testStopServersAandBMultipleTimes.vi" Type="VI" URL="../../tests/ServerInstancesTest/testCase/testStopServersAandBMultipleTimes.vi"/>
					<Item Name="testTwoClientsSendCmdAtSameTime.vi" Type="VI" URL="../../tests/ServerInstancesTest/testCase/testTwoClientsSendCmdAtSameTime.vi"/>
					<Item Name="testTwoClientsSendEventsAtSameTime.vi" Type="VI" URL="../../tests/ServerInstancesTest/testCase/testTwoClientsSendEventsAtSameTime.vi"/>
					<Item Name="testTwoClientsSendTelemetryAtSameTime.vi" Type="VI" URL="../../tests/ServerInstancesTest/testCase/testTwoClientsSendTelemetryAtSameTime.vi"/>
					<Item Name="testTwoServersSendCmdStatusToClientsAtSameTime.vi" Type="VI" URL="../../tests/ServerInstancesTest/testCase/testTwoServersSendCmdStatusToClientsAtSameTime.vi"/>
					<Item Name="testTwoServersSendEventsToClientsAtSameTime.vi" Type="VI" URL="../../tests/ServerInstancesTest/testCase/testTwoServersSendEventsToClientsAtSameTime.vi"/>
					<Item Name="testTwoServersSendTelemetryAtSameTime.vi" Type="VI" URL="../../tests/ServerInstancesTest/testCase/testTwoServersSendTelemetryAtSameTime.vi"/>
					<Item Name="testTwoServersReportConnStatus.vi" Type="VI" URL="../../tests/ServerInstancesTest/testCase/testTwoServersReportConnStatus.vi"/>
					<Item Name="testTwoServersReportInternalError.vi" Type="VI" URL="../../tests/ServerInstancesTest/testCase/testTwoServersReportInternalError.vi"/>
					<Item Name="testTwoServersReportLogMessages.vi" Type="VI" URL="../../tests/ServerInstancesTest/testCase/testTwoServersReportLogMessages.vi"/>
					<Item Name="testTwoServersReportConnStatusMultipleTimes.vi" Type="VI" URL="../../tests/ServerInstancesTest/testCase/testTwoServersReportConnStatusMultipleTimes.vi"/>
					<Item Name="testUserStopsServersAandB.vi" Type="VI" URL="../../tests/ServerInstancesTest/testCase/testUserStopsServersAandB.vi"/>
				</Item>
				<Item Name="serverInstancesTest.vi" Type="VI" URL="../../tests/ServerInstancesTest/serverInstancesTest.vi"/>
				<Item Name="connectTcpClientA.vi" Type="VI" URL="../../tests/ServerInstancesTest/connectTcpClientA.vi"/>
				<Item Name="connectTcpClientB.vi" Type="VI" URL="../../tests/ServerInstancesTest/connectTcpClientB.vi"/>
				<Item Name="destroyReferencesTwoTcpServers.vi" Type="VI" URL="../../tests/ServerInstancesTest/destroyReferencesTwoTcpServers.vi"/>
				<Item Name="disconnectTcpClient.vi" Type="VI" URL="../../tests/ServerInstancesTest/disconnectTcpClient.vi"/>
				<Item Name="generateInternalError.vi" Type="VI" URL="../../tests/ServerInstancesTest/generateInternalError.vi"/>
				<Item Name="instantiateTwoTcpServer.vi" Type="VI" URL="../../tests/ServerInstancesTest/instantiateTwoTcpServer.vi"/>
				<Item Name="readTcpPacketAsString.vi" Type="VI" URL="../../tests/ServerInstancesTest/readTcpPacketAsString.vi"/>
				<Item Name="sendCmdFromTcpClient.vi" Type="VI" URL="../../tests/ServerInstancesTest/sendCmdFromTcpClient.vi"/>
				<Item Name="sendEventsFromTcpClient.vi" Type="VI" URL="../../tests/ServerInstancesTest/sendEventsFromTcpClient.vi"/>
				<Item Name="sendEventToClient.vi" Type="VI" URL="../../tests/ServerInstancesTest/sendEventToClient.vi"/>
				<Item Name="sendLogMessage.vi" Type="VI" URL="../../tests/ServerInstancesTest/sendLogMessage.vi"/>
				<Item Name="sendTelFromTcpClient.vi" Type="VI" URL="../../tests/ServerInstancesTest/sendTelFromTcpClient.vi"/>
				<Item Name="setDefaultServerA.vi" Type="VI" URL="../../tests/ServerInstancesTest/setDefaultServerA.vi"/>
				<Item Name="setDefaultServerB.vi" Type="VI" URL="../../tests/ServerInstancesTest/setDefaultServerB.vi"/>
				<Item Name="startTcpServerA.vi" Type="VI" URL="../../tests/ServerInstancesTest/startTcpServerA.vi"/>
				<Item Name="startTcpServerB.vi" Type="VI" URL="../../tests/ServerInstancesTest/startTcpServerB.vi"/>
			</Item>
			<Item Name="testAll.vi" Type="VI" URL="../../tests/testAll.vi"/>
			<Item Name="testAllWithXmlReport.vi" Type="VI" URL="../../tests/testAllWithXmlReport.vi"/>
			<Item Name="setDefaultServer.vi" Type="VI" URL="../../tests/setDefaultServer.vi"/>
		</Item>
		<Item Name="simulator" Type="Folder">
			<Item Name="configFile" Type="Folder">
				<Item Name="createConfigFilePath.vi" Type="VI" URL="../../simulator/configFile/createConfigFilePath.vi"/>
				<Item Name="readConfigFileDefault.vi" Type="VI" URL="../../simulator/configFile/readConfigFileDefault.vi"/>
				<Item Name="readKeysFromConfigFile.vi" Type="VI" URL="../../simulator/configFile/readKeysFromConfigFile.vi"/>
				<Item Name="readConfigEvtTel.vi" Type="VI" URL="../../simulator/configFile/readConfigEvtTel.vi"/>
			</Item>
			<Item Name="ComponentSimulatorLauncher.vi" Type="VI" URL="../../simulator/ComponentSimulatorLauncher.vi"/>
			<Item Name="ComponentSimulator.vi" Type="VI" URL="../../simulator/ComponentSimulator.vi"/>
		</Item>
		<Item Name="FactoryTcpServer" Type="Folder">
			<Item Name="FactoryTcpServer.lvclass" Type="LVClass" URL="../FactoryTcpServer/FactoryTcpServer.lvclass"/>
		</Item>
		<Item Name="TcpServerBase" Type="Folder">
			<Item Name="TcpServerBase.lvclass" Type="LVClass" URL="../TcpServerBase/TcpServerBase.lvclass"/>
		</Item>
		<Item Name="TcpServerCmd" Type="Folder">
			<Item Name="TcpServerCmd.lvclass" Type="LVClass" URL="../TcpServerCmd/TcpServerCmd.lvclass"/>
		</Item>
		<Item Name="TcpServerTel" Type="Folder">
			<Item Name="TcpServerTel.lvclass" Type="LVClass" URL="../TcpServerTel/TcpServerTel.lvclass"/>
		</Item>
		<Item Name="TcpServer" Type="Folder">
			<Item Name="TcpServer.lvclass" Type="LVClass" URL="../TcpServer/TcpServer.lvclass"/>
		</Item>
		<Item Name="build" Type="Folder">
			<Item Name="buildApp.vi" Type="VI" URL="../buildApp.vi"/>
		</Item>
		<Item Name="Utility" Type="Folder">
			<Item Name="keyValuePair" Type="Folder">
				<Item Name="convertToKeyValuePair.vi" Type="VI" URL="../Utility/keyValuePair/convertToKeyValuePair.vi"/>
				<Item Name="convertToKeyValuePair_1Ddouble.vi" Type="VI" URL="../Utility/keyValuePair/convertToKeyValuePair_1Ddouble.vi"/>
				<Item Name="convertToKeyValuePair_2Ddouble.vi" Type="VI" URL="../Utility/keyValuePair/convertToKeyValuePair_2Ddouble.vi"/>
				<Item Name="convertToKeyValuePair_1Dstring.vi" Type="VI" URL="../Utility/keyValuePair/convertToKeyValuePair_1Dstring.vi"/>
				<Item Name="convertToKeyValuePair_boolean.vi" Type="VI" URL="../Utility/keyValuePair/convertToKeyValuePair_boolean.vi"/>
				<Item Name="convertToKeyValuePair_double.vi" Type="VI" URL="../Utility/keyValuePair/convertToKeyValuePair_double.vi"/>
				<Item Name="convertToKeyValuePair_integer32bit.vi" Type="VI" URL="../Utility/keyValuePair/convertToKeyValuePair_integer32bit.vi"/>
				<Item Name="convertToKeyValuePair_integer64bit.vi" Type="VI" URL="../Utility/keyValuePair/convertToKeyValuePair_integer64bit.vi"/>
				<Item Name="convertToKeyValuePair_string.vi" Type="VI" URL="../Utility/keyValuePair/convertToKeyValuePair_string.vi"/>
				<Item Name="convertToKeyValuePair_unsignedInteger32bit.vi" Type="VI" URL="../Utility/keyValuePair/convertToKeyValuePair_unsignedInteger32bit.vi"/>
				<Item Name="convertToKeyValuePair_unsignedInteger64bit.vi" Type="VI" URL="../Utility/keyValuePair/convertToKeyValuePair_unsignedInteger64bit.vi"/>
				<Item Name="doubleArrayToStringWithBrackets.vi" Type="VI" URL="../Utility/keyValuePair/doubleArrayToStringWithBrackets.vi"/>
				<Item Name="stringArrayToStringWithBrackets.vi" Type="VI" URL="../Utility/keyValuePair/stringArrayToStringWithBrackets.vi"/>
			</Item>
			<Item Name="buildPathFromStrArr.vi" Type="VI" URL="../Utility/buildPathFromStrArr.vi"/>
		</Item>
		<Item Name="config" Type="Folder">
			<Item Name="default.ini" Type="Document" URL="../../config/default.ini"/>
		</Item>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="vi.lib" Type="Folder">
				<Item Name="Clear Errors.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Clear Errors.vi"/>
				<Item Name="Caraya.lvlib" Type="Library" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/Caraya/Caraya.lvlib"/>
				<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi"/>
				<Item Name="Parse State Queue__JKI_lib_State_Machine.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/State Machine/_JKI_lib_State_Machine.llb/Parse State Queue__JKI_lib_State_Machine.vi"/>
				<Item Name="Add State(s) to Queue__JKI_lib_State_Machine.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/State Machine/_JKI_lib_State_Machine.llb/Add State(s) to Queue__JKI_lib_State_Machine.vi"/>
				<Item Name="General Error Handler.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler.vi"/>
				<Item Name="DialogType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogType.ctl"/>
				<Item Name="DialogTypeEnum.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogTypeEnum.ctl"/>
				<Item Name="General Error Handler Core CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler Core CORE.vi"/>
				<Item Name="whitespace.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/whitespace.ctl"/>
				<Item Name="Check Special Tags.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Check Special Tags.vi"/>
				<Item Name="TagReturnType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/TagReturnType.ctl"/>
				<Item Name="Set String Value.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set String Value.vi"/>
				<Item Name="GetRTHostConnectedProp.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetRTHostConnectedProp.vi"/>
				<Item Name="Error Code Database.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Code Database.vi"/>
				<Item Name="Trim Whitespace.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Trim Whitespace.vi"/>
				<Item Name="Format Message String.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Format Message String.vi"/>
				<Item Name="Find Tag.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Find Tag.vi"/>
				<Item Name="Search and Replace Pattern.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Search and Replace Pattern.vi"/>
				<Item Name="Set Bold Text.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set Bold Text.vi"/>
				<Item Name="Details Display Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Details Display Dialog.vi"/>
				<Item Name="ErrWarn.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/ErrWarn.ctl"/>
				<Item Name="eventvkey.ctl" Type="VI" URL="/&lt;vilib&gt;/event_ctls.llb/eventvkey.ctl"/>
				<Item Name="Not Found Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Not Found Dialog.vi"/>
				<Item Name="Three Button Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog.vi"/>
				<Item Name="Three Button Dialog CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog CORE.vi"/>
				<Item Name="LVRectTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVRectTypeDef.ctl"/>
				<Item Name="Longest Line Length in Pixels.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Longest Line Length in Pixels.vi"/>
				<Item Name="Convert property node font to graphics font.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Convert property node font to graphics font.vi"/>
				<Item Name="Get Text Rect.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Get Text Rect.vi"/>
				<Item Name="Get String Text Bounds.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Get String Text Bounds.vi"/>
				<Item Name="LVBoundsTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVBoundsTypeDef.ctl"/>
				<Item Name="BuildHelpPath.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/BuildHelpPath.vi"/>
				<Item Name="GetHelpDir.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetHelpDir.vi"/>
				<Item Name="Unset Busy.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/cursorutil.llb/Unset Busy.vi"/>
				<Item Name="Set Cursor.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/cursorutil.llb/Set Cursor.vi"/>
				<Item Name="Set Cursor (Cursor ID).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/cursorutil.llb/Set Cursor (Cursor ID).vi"/>
				<Item Name="Set Cursor (Icon Pict).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/cursorutil.llb/Set Cursor (Icon Pict).vi"/>
				<Item Name="Set Busy.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/cursorutil.llb/Set Busy.vi"/>
				<Item Name="imagedata.ctl" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/imagedata.ctl"/>
				<Item Name="subFile Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/express/express input/FileDialogBlock.llb/subFile Dialog.vi"/>
				<Item Name="ex_CorrectErrorChain.vi" Type="VI" URL="/&lt;vilib&gt;/express/express shared/ex_CorrectErrorChain.vi"/>
				<Item Name="Open URL in Default Browser.vi" Type="VI" URL="/&lt;vilib&gt;/Platform/browser.llb/Open URL in Default Browser.vi"/>
				<Item Name="Open URL in Default Browser (string).vi" Type="VI" URL="/&lt;vilib&gt;/Platform/browser.llb/Open URL in Default Browser (string).vi"/>
				<Item Name="Open URL in Default Browser core.vi" Type="VI" URL="/&lt;vilib&gt;/Platform/browser.llb/Open URL in Default Browser core.vi"/>
				<Item Name="Get Web Browser Path.vi" Type="VI" URL="/&lt;vilib&gt;/Platform/browser.llb/Get Web Browser Path.vi"/>
				<Item Name="Get System Web Browser.vi" Type="VI" URL="/&lt;vilib&gt;/Platform/browser.llb/Get System Web Browser.vi"/>
				<Item Name="Prompt Web Browser Path.vi" Type="VI" URL="/&lt;vilib&gt;/Platform/browser.llb/Prompt Web Browser Path.vi"/>
				<Item Name="Dflt Data Dir.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Dflt Data Dir.vi"/>
				<Item Name="Create Directory Recursive.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Create Directory Recursive.vi"/>
				<Item Name="System Exec.vi" Type="VI" URL="/&lt;vilib&gt;/Platform/system.llb/System Exec.vi"/>
				<Item Name="Open URL in Default Browser (path).vi" Type="VI" URL="/&lt;vilib&gt;/Platform/browser.llb/Open URL in Default Browser (path).vi"/>
				<Item Name="Path to URL.vi" Type="VI" URL="/&lt;vilib&gt;/printing/PathToURL.llb/Path to URL.vi"/>
				<Item Name="Escape Characters for HTTP.vi" Type="VI" URL="/&lt;vilib&gt;/printing/PathToURL.llb/Escape Characters for HTTP.vi"/>
				<Item Name="Has LLB Extension.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Has LLB Extension.vi"/>
				<Item Name="Get VI Library File Info.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Get VI Library File Info.vi"/>
				<Item Name="Librarian File Info Out.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Librarian File Info Out.ctl"/>
				<Item Name="Librarian.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Librarian.vi"/>
				<Item Name="Librarian File Info In.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Librarian File Info In.ctl"/>
				<Item Name="Librarian File List.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Librarian File List.ctl"/>
				<Item Name="Application Directory.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Application Directory.vi"/>
				<Item Name="NI_FileType.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/lvfile.llb/NI_FileType.lvlib"/>
				<Item Name="TRef TravTarget.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/traverseref.llb/TRef TravTarget.ctl"/>
				<Item Name="TRef Traverse for References.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/traverseref.llb/TRef Traverse for References.vi"/>
				<Item Name="VI Scripting - Traverse.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/traverseref.llb/VI Scripting - Traverse.lvlib"/>
				<Item Name="Get File System Separator.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/sysinfo.llb/Get File System Separator.vi"/>
				<Item Name="System Directory Type.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/sysdir.llb/System Directory Type.ctl"/>
				<Item Name="Get System Directory.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/sysdir.llb/Get System Directory.vi"/>
				<Item Name="Check if File or Folder Exists.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Check if File or Folder Exists.vi"/>
				<Item Name="NI_PackedLibraryUtility.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/LVLibp/NI_PackedLibraryUtility.lvlib"/>
				<Item Name="NI_LVConfig.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/config.llb/NI_LVConfig.lvlib"/>
				<Item Name="8.6CompatibleGlobalVar.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/config.llb/8.6CompatibleGlobalVar.vi"/>
				<Item Name="Space Constant.vi" Type="VI" URL="/&lt;vilib&gt;/dlg_ctls.llb/Space Constant.vi"/>
				<Item Name="Recursive File List.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Recursive File List.vi"/>
				<Item Name="List Directory and LLBs.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/List Directory and LLBs.vi"/>
				<Item Name="Caraya Interactive Menu.rtm" Type="Document" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/Caraya/menu/Caraya Interactive Menu.rtm"/>
				<Item Name="VariantType.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/VariantDataType/VariantType.lvlib"/>
				<Item Name="TRef Traverse.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/traverseref.llb/TRef Traverse.vi"/>
				<Item Name="NI_App_Builder_API.lvlib" Type="Library" URL="/&lt;vilib&gt;/AppBuilder/AB_API_Simple/NI_App_Builder_API.lvlib"/>
				<Item Name="GetTargetBuildSpecs.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/GetTargetBuildSpecs.vi"/>
				<Item Name="GetTargetBuildSpecs (project reference).vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/GetTargetBuildSpecs (project reference).vi"/>
				<Item Name="AB_Generate_Error_Cluster.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Generate_Error_Cluster.vi"/>
				<Item Name="Invoke BuildTarget.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/Invoke BuildTarget.vi"/>
				<Item Name="Stall Data Flow.vim" Type="VI" URL="/&lt;vilib&gt;/Utility/Stall Data Flow.vim"/>
				<Item Name="usereventprio.ctl" Type="VI" URL="/&lt;vilib&gt;/event_ctls.llb/usereventprio.ctl"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Unwrap VVariant__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Unwrap VVariant__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Variant to Header Info__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Variant to Header Info__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Get Header from TD__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Get Header from TD__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Build Error Cluster__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Build Error Cluster__ogtk.vi"/>
				<Item Name="TD_Get MDT Information.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/GetType.llb/TD_Get MDT Information.vi"/>
				<Item Name="Type Descriptor I16 Array.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/GetType.llb/Type Descriptor I16 Array.ctl"/>
				<Item Name="Type Descriptor I16.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/GetType.llb/Type Descriptor I16.ctl"/>
				<Item Name="TD_MDTFlavor.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/GetType.llb/TD_MDTFlavor.ctl"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Timestamp to ISO8601 UTC DateTime.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Timestamp to ISO8601 UTC DateTime.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Get Local UTC Offset.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Get Local UTC Offset.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Cluster to Array of VData__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Cluster to Array of VData__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Split Cluster TD__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Split Cluster TD__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Parse String with TDs__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Parse String with TDs__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Array to Array of VData__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Array to Array of VData__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Reshape Array to 1D VArray__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Reshape Array to 1D VArray__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Array Size(s)__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Array Size(s)__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Get Data Name__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Get Data Name__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Get Data Name from TD__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Get Data Name from TD__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Get PString__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Get PString__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Get Last PString__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Get Last PString__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Set Data Name__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Set Data Name__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Get Variant Attributes__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Get Variant Attributes__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Get Physical Units__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Get Physical Units__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Get Physical Units from TD__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Get Physical Units from TD__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Get TDEnum from TD__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Get TDEnum from TD__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Get Element TD from Array TD__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Get Element TD from Array TD__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Format Variant Into String__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Format Variant Into String__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Get TDEnum from Data__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Get TDEnum from Data__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Get Refnum Type Enum from Data__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Get Refnum Type Enum from Data__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Get Refnum Type Enum from TD__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Get Refnum Type Enum from TD__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Strip Units__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Strip Units__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Get Array Element TDEnum__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Get Array Element TDEnum__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Get Strings from Enum__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Get Strings from Enum__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Get Strings from Enum TD__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Get Strings from Enum TD__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Get Waveform Type Enum from Data__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Get Waveform Type Enum from Data__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Get Waveform Type Enum from TD__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Get Waveform Type Enum from TD__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Resolve Timestamp Format__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Resolve Timestamp Format__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Trim Whitespace (String)__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Trim Whitespace (String)__ogtk.vi"/>
				<Item Name="Get File Extension.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Get File Extension.vi"/>
				<Item Name="Compare Two Paths.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Compare Two Paths.vi"/>
				<Item Name="Get LV Class Name.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/LVClass/Get LV Class Name.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5File Exists - Scalar__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5File Exists - Scalar__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Remove Duplicates from 1D Array (Path)__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Remove Duplicates from 1D Array (Path)__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5List Directory Recursive__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5List Directory Recursive__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5List Directory__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5List Directory__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Remove Duplicates from 1D Array (String)__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Remove Duplicates from 1D Array (String)__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Build Path - File Names Array__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Build Path - File Names Array__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Filter 1D Array (Path)__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Filter 1D Array (Path)__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Search 1D Array (Path)__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Search 1D Array (Path)__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Delete Elements from 1D Array (Path)__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Delete Elements from 1D Array (Path)__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Sort 1D Array (I32)__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Sort 1D Array (I32)__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Reorder 1D Array2 (Path)__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Reorder 1D Array2 (Path)__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Strip Path Extension - String__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Strip Path Extension - String__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Filter 1D Array (String)__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Filter 1D Array (String)__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Search 1D Array (String)__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Search 1D Array (String)__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Delete Elements from 1D Array (String)__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Delete Elements from 1D Array (String)__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Reorder 1D Array2 (String)__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Reorder 1D Array2 (String)__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Remove Duplicates from 1D Array (I32)__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Remove Duplicates from 1D Array (I32)__ogtk.vi"/>
				<Item Name="7842910552F72B45FFAA5B67DFEBCBC5Empty 1D Array (String)__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/7842910552F72B45FFAA5B67DFEBCBC5Empty 1D Array (String)__ogtk.vi"/>
			</Item>
			<Item Name="provcom_StringGlobals.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Common/provcom_StringGlobals.vi"/>
		</Item>
		<Item Name="Build Specifications" Type="Build">
			<Item Name="ComponentSimulator" Type="EXE">
				<Property Name="App_copyErrors" Type="Bool">true</Property>
				<Property Name="App_INI_aliasGUID" Type="Str">{5F670F7E-C3BD-11EB-91FF-02428DC4B39C}</Property>
				<Property Name="App_INI_GUID" Type="Str">{5F670E66-C3BD-11EB-91FF-02428DC4B39C}</Property>
				<Property Name="App_serverConfig.httpPort" Type="Int">8002</Property>
				<Property Name="Bld_autoIncrement" Type="Bool">true</Property>
				<Property Name="Bld_buildCacheID" Type="Str">{5F6718F0-C3BD-11EB-91FF-02428DC4B39C}</Property>
				<Property Name="Bld_buildSpecDescription" Type="Str">Component Simulator to run the LabVIEW TCP Server.</Property>
				<Property Name="Bld_buildSpecName" Type="Str">ComponentSimulator</Property>
				<Property Name="Bld_excludeInlineSubVIs" Type="Bool">true</Property>
				<Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
				<Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
				<Property Name="Bld_localDestDir" Type="Path">../build</Property>
				<Property Name="Bld_localDestDirType" Type="Str">relativeToCommon</Property>
				<Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
				<Property Name="Bld_previewCacheID" Type="Str">{5F67191D-C3BD-11EB-91FF-02428DC4B39C}</Property>
				<Property Name="Bld_userLogFile" Type="Path">../build/buildComponentSimulator.txt</Property>
				<Property Name="Bld_userLogFile.pathType" Type="Str">relativeToCommon</Property>
				<Property Name="Bld_version.build" Type="Int">34</Property>
				<Property Name="Bld_version.major" Type="Int">1</Property>
				<Property Name="DestinationCount" Type="Int">2</Property>
				<Property Name="Destination[0].destName" Type="Str">ComponentSimulator</Property>
				<Property Name="Destination[0].path" Type="Path">../build/ComponentSimulator</Property>
				<Property Name="Destination[0].preserveHierarchy" Type="Bool">true</Property>
				<Property Name="Destination[0].type" Type="Str">App</Property>
				<Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
				<Property Name="Destination[1].path" Type="Path">../build/data</Property>
				<Property Name="SourceCount" Type="Int">4</Property>
				<Property Name="Source[0].itemID" Type="Str">{F469E460-D59F-11EE-A973-B04F130BB390}</Property>
				<Property Name="Source[0].type" Type="Str">Container</Property>
				<Property Name="Source[1].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[1].itemID" Type="Ref">/My Computer/simulator/ComponentSimulator.vi</Property>
				<Property Name="Source[1].type" Type="Str">VI</Property>
				<Property Name="Source[2].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[2].itemID" Type="Ref">/My Computer/config/default.ini</Property>
				<Property Name="Source[3].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[3].itemID" Type="Ref">/My Computer/simulator/ComponentSimulatorLauncher.vi</Property>
				<Property Name="Source[3].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[3].type" Type="Str">VI</Property>
				<Property Name="TgtF_fileDescription" Type="Str">ComponentSimulator</Property>
				<Property Name="TgtF_internalName" Type="Str">ComponentSimulator</Property>
				<Property Name="TgtF_legalCopyright" Type="Str">Copyright 2021 </Property>
				<Property Name="TgtF_productName" Type="Str">ComponentSimulator</Property>
				<Property Name="TgtF_targetfileGUID" Type="Str">{5F6717C2-C3BD-11EB-91FF-02428DC4B39C}</Property>
				<Property Name="TgtF_targetfileName" Type="Str">ComponentSimulator</Property>
				<Property Name="TgtF_versionIndependent" Type="Bool">true</Property>
			</Item>
		</Item>
	</Item>
</Project>
