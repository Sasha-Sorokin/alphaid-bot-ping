getLogger = require("loggy")
utils = require("@utils/utils")
i18n = require("@utils/ez-i18n")
{ ErrorMessages } = require("@sb-types/Consts");

class Ping
	constructor: () ->
		@_log = getLogger "Ping"

	init: (i) =>
		if (i.baseCheck @) and not i.isPendingInitialization()
			throw new Error ErrorMessages.NOT_PENDING_INITIALIZATION

		# Messages Flows Interface
		mfi = i.getDependency "messages-flows"

		if not mfi?
			throw new Error "Messages Flows must be installed"

		@_i18nClean = await i18n.extendAndAssign [__dirname, "i18n"], i

		mfi.onInit (flows) =>
			@_flowsHandler = flows.watchForCommands (
				(ctx) => @_onMessage(ctx)
			), "ping"

		@_log "info", "Registered command and ready to work"

	_onMessage: (ctx) =>
		{ message: msg } = ctx;
		{ channel } = msg;

		i18nTarget = await utils.getMessageMemberOrAuthor msg

		replyText = await i18n.localizeForUser i18nTarget, "PING_REPLY"

		timeRecord = Date.now()

		reply = await channel.send replyText

		ping = Math.trunc Date.now() - timeRecord

		@_log "info", "Ping for #{channel.id} is #{ping}ms"

		replyText = await i18n.localizeForUser i18nTarget, "PING_REPLY@DONE", { ping }

		reply.edit replyText

	unload: (i) =>
		if (i.baseCheck @) and not i.isPendingUnload()
			throw new Error ErrorMessages.NOT_PENDING_UNLOAD

		if @_i18nClean?
			@_i18nClean()

		if @_flowsHandler?
			@_flowsHandler.unhandle()

		return true

module.exports = { default: Ping, Ping }
