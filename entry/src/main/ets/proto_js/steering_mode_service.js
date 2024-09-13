/*eslint-disable block-scoped-var, id-length, no-control-regex, no-magic-numbers, no-prototype-builtins, no-redeclare, no-shadow, no-var, sort-vars*/
// import * as $protobuf from "protobufjs/minimal";
import * as $protobuf from "@ohos/protobufjs";
import Long from 'long';
$protobuf.util.Long = Long
$protobuf.configure()

// Common aliases
const $Reader = $protobuf.Reader, $Writer = $protobuf.Writer, $util = $protobuf.util;

// Exported root namespace
const $root = $protobuf.roots["default"] || ($protobuf.roots["default"] = {});

export const steering_mode = $root.steering_mode = (() => {

    /**
     * Namespace steering_mode.
     * @exports steering_mode
     * @namespace
     */
    const steering_mode = {};

    steering_mode.SteeringModeResponse = (function () {

        /**
         * Properties of a SteeringModeResponse.
         * @memberof steering_mode
         * @interface ISteeringModeResponse
         * @property {string|null} [steeringMode] SteeringModeResponse steeringMode
         * @property {number|Long|null} [steeringModeId] SteeringModeResponse steeringModeId
         */

        /**
         * Constructs a new SteeringModeResponse.
         * @memberof steering_mode
         * @classdesc Represents a SteeringModeResponse.
         * @implements ISteeringModeResponse
         * @constructor
         * @param {steering_mode.ISteeringModeResponse=} [properties] Properties to set
         */
        function SteeringModeResponse(properties) {
            if (properties)
                for (let keys = Object.keys(properties), i = 0; i < keys.length; ++i)
                    if (properties[keys[i]] != null)
                        this[keys[i]] = properties[keys[i]];
        }

        /**
         * SteeringModeResponse steeringMode.
         * @member {string} steeringMode
         * @memberof steering_mode.SteeringModeResponse
         * @instance
         */
        SteeringModeResponse.prototype.steeringMode = "";

        /**
         * SteeringModeResponse steeringModeId.
         * @member {number|Long} steeringModeId
         * @memberof steering_mode.SteeringModeResponse
         * @instance
         */
        SteeringModeResponse.prototype.steeringModeId = $util.Long ? $util.Long.fromBits(0, 0, false) : 0;

        /**
         * Creates a new SteeringModeResponse instance using the specified properties.
         * @function create
         * @memberof steering_mode.SteeringModeResponse
         * @static
         * @param {steering_mode.ISteeringModeResponse=} [properties] Properties to set
         * @returns {steering_mode.SteeringModeResponse} SteeringModeResponse instance
         */
        SteeringModeResponse.create = function create(properties) {
            return new SteeringModeResponse(properties);
        };

        /**
         * Encodes the specified SteeringModeResponse message. Does not implicitly {@link steering_mode.SteeringModeResponse.verify|verify} messages.
         * @function encode
         * @memberof steering_mode.SteeringModeResponse
         * @static
         * @param {steering_mode.ISteeringModeResponse} message SteeringModeResponse message or plain object to encode
         * @param {$protobuf.Writer} [writer] Writer to encode to
         * @returns {$protobuf.Writer} Writer
         */
        SteeringModeResponse.encode = function encode(message, writer) {
            if (!writer)
                writer = $Writer.create();
            if (message.steeringMode != null && Object.hasOwnProperty.call(message, "steeringMode"))
                writer.uint32(/* id 1, wireType 2 =*/10).string(message.steeringMode);
            if (message.steeringModeId != null && Object.hasOwnProperty.call(message, "steeringModeId"))
                writer.uint32(/* id 2, wireType 0 =*/16).int64(message.steeringModeId);
            return writer;
        };

        /**
         * Encodes the specified SteeringModeResponse message, length delimited. Does not implicitly {@link steering_mode.SteeringModeResponse.verify|verify} messages.
         * @function encodeDelimited
         * @memberof steering_mode.SteeringModeResponse
         * @static
         * @param {steering_mode.ISteeringModeResponse} message SteeringModeResponse message or plain object to encode
         * @param {$protobuf.Writer} [writer] Writer to encode to
         * @returns {$protobuf.Writer} Writer
         */
        SteeringModeResponse.encodeDelimited = function encodeDelimited(message, writer) {
            return this.encode(message, writer).ldelim();
        };

        /**
         * Decodes a SteeringModeResponse message from the specified reader or buffer.
         * @function decode
         * @memberof steering_mode.SteeringModeResponse
         * @static
         * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
         * @param {number} [length] Message length if known beforehand
         * @returns {steering_mode.SteeringModeResponse} SteeringModeResponse
         * @throws {Error} If the payload is not a reader or valid buffer
         * @throws {$protobuf.util.ProtocolError} If required fields are missing
         */
        SteeringModeResponse.decode = function decode(reader, length) {
            if (!(reader instanceof $Reader))
                reader = $Reader.create(reader);
            let end = length === undefined ? reader.len : reader.pos + length, message = new $root.steering_mode.SteeringModeResponse();
            while (reader.pos < end) {
                let tag = reader.uint32();
                switch (tag >>> 3) {
                    case 1: {
                        message.steeringMode = reader.string();
                        break;
                    }
                    case 2: {
                        message.steeringModeId = reader.int64();
                        break;
                    }
                    default:
                        reader.skipType(tag & 7);
                        break;
                }
            }
            return message;
        };

        /**
         * Decodes a SteeringModeResponse message from the specified reader or buffer, length delimited.
         * @function decodeDelimited
         * @memberof steering_mode.SteeringModeResponse
         * @static
         * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
         * @returns {steering_mode.SteeringModeResponse} SteeringModeResponse
         * @throws {Error} If the payload is not a reader or valid buffer
         * @throws {$protobuf.util.ProtocolError} If required fields are missing
         */
        SteeringModeResponse.decodeDelimited = function decodeDelimited(reader) {
            if (!(reader instanceof $Reader))
                reader = new $Reader(reader);
            return this.decode(reader, reader.uint32());
        };

        /**
         * Verifies a SteeringModeResponse message.
         * @function verify
         * @memberof steering_mode.SteeringModeResponse
         * @static
         * @param {Object.<string,*>} message Plain object to verify
         * @returns {string|null} `null` if valid, otherwise the reason why it is not
         */
        SteeringModeResponse.verify = function verify(message) {
            if (typeof message !== "object" || message === null)
                return "object expected";
            if (message.steeringMode != null && message.hasOwnProperty("steeringMode"))
                if (!$util.isString(message.steeringMode))
                    return "steeringMode: string expected";
            if (message.steeringModeId != null && message.hasOwnProperty("steeringModeId"))
                if (!$util.isInteger(message.steeringModeId) && !(message.steeringModeId && $util.isInteger(message.steeringModeId.low) && $util.isInteger(message.steeringModeId.high)))
                    return "steeringModeId: integer|Long expected";
            return null;
        };

        /**
         * Creates a SteeringModeResponse message from a plain object. Also converts values to their respective internal types.
         * @function fromObject
         * @memberof steering_mode.SteeringModeResponse
         * @static
         * @param {Object.<string,*>} object Plain object
         * @returns {steering_mode.SteeringModeResponse} SteeringModeResponse
         */
        SteeringModeResponse.fromObject = function fromObject(object) {
            if (object instanceof $root.steering_mode.SteeringModeResponse)
                return object;
            let message = new $root.steering_mode.SteeringModeResponse();
            if (object.steeringMode != null)
                message.steeringMode = String(object.steeringMode);
            if (object.steeringModeId != null)
                if ($util.Long)
                    (message.steeringModeId = $util.Long.fromValue(object.steeringModeId)).unsigned = false;
                else if (typeof object.steeringModeId === "string")
                    message.steeringModeId = parseInt(object.steeringModeId, 10);
                else if (typeof object.steeringModeId === "number")
                    message.steeringModeId = object.steeringModeId;
                else if (typeof object.steeringModeId === "object")
                    message.steeringModeId = new $util.LongBits(object.steeringModeId.low >>> 0, object.steeringModeId.high >>> 0).toNumber();
            return message;
        };

        /**
         * Creates a plain object from a SteeringModeResponse message. Also converts values to other types if specified.
         * @function toObject
         * @memberof steering_mode.SteeringModeResponse
         * @static
         * @param {steering_mode.SteeringModeResponse} message SteeringModeResponse
         * @param {$protobuf.IConversionOptions} [options] Conversion options
         * @returns {Object.<string,*>} Plain object
         */
        SteeringModeResponse.toObject = function toObject(message, options) {
            if (!options)
                options = {};
            let object = {};
            if (options.defaults) {
                object.steeringMode = "";
                if ($util.Long) {
                    let long = new $util.Long(0, 0, false);
                    object.steeringModeId = options.longs === String ? long.toString() : options.longs === Number ? long.toNumber() : long;
                } else
                    object.steeringModeId = options.longs === String ? "0" : 0;
            }
            if (message.steeringMode != null && message.hasOwnProperty("steeringMode"))
                object.steeringMode = message.steeringMode;
            if (message.steeringModeId != null && message.hasOwnProperty("steeringModeId"))
                if (typeof message.steeringModeId === "number")
                    object.steeringModeId = options.longs === String ? String(message.steeringModeId) : message.steeringModeId;
                else
                    object.steeringModeId = options.longs === String ? $util.Long.prototype.toString.call(message.steeringModeId) : options.longs === Number ? new $util.LongBits(message.steeringModeId.low >>> 0, message.steeringModeId.high >>> 0).toNumber() : message.steeringModeId;
            return object;
        };

        /**
         * Converts this SteeringModeResponse to JSON.
         * @function toJSON
         * @memberof steering_mode.SteeringModeResponse
         * @instance
         * @returns {Object.<string,*>} JSON object
         */
        SteeringModeResponse.prototype.toJSON = function toJSON() {
            return this.constructor.toObject(this, $protobuf.util.toJSONOptions);
        };

        /**
         * Gets the default type url for SteeringModeResponse
         * @function getTypeUrl
         * @memberof steering_mode.SteeringModeResponse
         * @static
         * @param {string} [typeUrlPrefix] your custom typeUrlPrefix(default "type.googleapis.com")
         * @returns {string} The default type url
         */
        SteeringModeResponse.getTypeUrl = function getTypeUrl(typeUrlPrefix) {
            if (typeUrlPrefix === undefined) {
                typeUrlPrefix = "type.googleapis.com";
            }
            return typeUrlPrefix + "/steering_mode.SteeringModeResponse";
        };

        return SteeringModeResponse;
    })();

    return steering_mode;
})();

export { $root as default };
