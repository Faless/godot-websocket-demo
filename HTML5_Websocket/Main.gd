extends Node

var tcp = StreamPeerTCP.new()
var peer = PacketPeerStream.new()
var _conn = false

func _ready():
	_log("Started!")
	tcp.connect_to_host("127.0.0.1", 8000)
	_log("Connecting...")
	set_process(true)

func _process(delta):
	if tcp.get_status() == StreamPeerTCP.STATUS_CONNECTING:
		# still connecting, nothing to do
		pass
	elif tcp.get_status() == StreamPeerTCP.STATUS_CONNECTED:
		if _conn == false:
			_log("Connected!")
			peer.set_stream_peer(tcp)
			_conn = true
			peer.put_packet(var2bytes("First UTF-8 message: Það fer nú að verða verra ferðaveðrið"))
		if peer.get_available_packet_count() > 0:
			var pkt = peer.get_packet()
			_output("Got packet: " + str(Array(pkt)))
			_output("Packet text: " + str(bytes2var(pkt)))
		return
	elif _conn:
		_conn = false
		_log("Disconnected from server with status: " + str(tcp.get_status()))
	else:
		_log("Unable to connect, status: " + str(tcp.get_status()))
		set_process(false)

func _output(msg):
	get_node("Control/Panel/VLayout/ReplyText").add_text(str(msg) + "\n")

func _log(msg):
	get_node("Control/Panel/VLayout/LogText").add_text(str(msg) + "\n")

func _on_Button_pressed():
	if not _conn:
		_log("Cannot send, not connected")
	else:
		_log("Sending: " + get_node("Control/Panel/VLayout/HLayout/LineEdit").text)
		peer.put_packet(var2bytes(get_node("Control/Panel/VLayout/HLayout/LineEdit").text))
	get_node("Control/Panel/VLayout/HLayout/LineEdit").clear()
