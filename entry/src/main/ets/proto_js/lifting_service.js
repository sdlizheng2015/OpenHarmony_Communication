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

export const lifting = $root.lifting = (() => {

    /**
     * Namespace lifting.
     * @exports lifting
     * @namespace
     */
    const lifting = {};

    lifting.LiftingResponse = (function () {

        /**
         * Properties of a LiftingResponse.
         * @memberof lifting
         * @interface ILiftingResponse
         * @property {boolean|null} [isDown] LiftingResponse isDown
         */

        /**
         * Constructs a new LiftingResponse.
         * @memberof lifting
         * @classdesc Represents a LiftingResponse.
         * @implements ILiftingResponse
         * @constructor
         * @param {lifting.ILiftingResponse=} [properties] Properties to set
         */
        function LiftingResponse(properties) {
            if (properties)
                for (let keys = Object.keys(properties), i = 0; i < keys.length; ++i)
                    if (properties[keys[i]] != null)
                        this[keys[i]] = properties[keys[i]];
        }

        /**
         * LiftingResponse isDown.
         * @member {boolean} isDown
         * @memberof lifting.LiftingResponse
         * @instance
         */
        LiftingResponse.prototype.isDown = false;

        /**
         * Creates a new LiftingResponse instance using the specified properties.
         * @function create
         * @memberof lifting.LiftingResponse
         * @static
         * @param {lifting.ILiftingResponse=} [properties] Properties to set
         * @returns {lifting.LiftingResponse} LiftingResponse instance
         */
        LiftingResponse.create = function create(properties) {
            return new LiftingResponse(properties);
        };

        /**
         * Encodes the specified LiftingResponse message. Does not implicitly {@link lifting.LiftingResponse.verify|verify} messages.
         * @function encode
         * @memberof lifting.LiftingResponse
         * @static
         * @param {lifting.ILiftingResponse} message LiftingResponse message or plain object to encode
         * @param {$protobuf.Writer} [writer] Writer to encode to
         * @returns {$protobuf.Writer} Writer
         */
        LiftingResponse.encode = function encode(message, writer) {
            if (!writer)
                writer = $Writer.create();
            if (message.isDown != null && Object.hasOwnProperty.call(message, "isDown"))
                writer.uint32(/* id 1, wireType 0 =*/8).bool(message.isDown);
            return writer;
        };

        /**
         * Encodes the specified LiftingResponse message, length delimited. Does not implicitly {@link lifting.LiftingResponse.verify|verify} messages.
         * @function encodeDelimited
         * @memberof lifting.LiftingResponse
         * @static
         * @param {lifting.ILiftingResponse} message LiftingResponse message or plain object to encode
         * @param {$protobuf.Writer} [writer] Writer to encode to
         * @returns {$protobuf.Writer} Writer
         */
        LiftingResponse.encodeDelimited = function encodeDelimited(message, writer) {
            return this.encode(message, writer).ldelim();
        };

        /**
         * Decodes a LiftingResponse message from the specified reader or buffer.
         * @function decode
         * @memberof lifting.LiftingResponse
         * @static
         * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
         * @param {number} [length] Message length if known beforehand
         * @returns {lifting.LiftingResponse} LiftingResponse
         * @throws {Error} If the payload is not a reader or valid buffer
         * @throws {$protobuf.util.ProtocolError} If required fields are missing
         */
        LiftingResponse.decode = function decode(reader, length) {
            if (!(reader instanceof $Reader))
                reader = $Reader.create(reader);
            let end = length === undefined ? reader.len : reader.pos + length, message = new $root.lifting.LiftingResponse();
            while (reader.pos < end) {
                let tag = reader.uint32();
                switch (tag >>> 3) {
                    case 1: {
                        message.isDown = reader.bool();
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
         * Decodes a LiftingResponse message from the specified reader or buffer, length delimited.
         * @function decodeDelimited
         * @memberof lifting.LiftingResponse
         * @static
         * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
         * @returns {lifting.LiftingResponse} LiftingResponse
         * @throws {Error} If the payload is not a reader or valid buffer
         * @throws {$protobuf.util.ProtocolError} If required fields are missing
         */
        LiftingResponse.decodeDelimited = function decodeDelimited(reader) {
            if (!(reader instanceof $Reader))
                reader = new $Reader(reader);
            return this.decode(reader, reader.uint32());
        };

        /**
         * Verifies a LiftingResponse message.
         * @function verify
         * @memberof lifting.LiftingResponse
         * @static
         * @param {Object.<string,*>} message Plain object to verify
         * @returns {string|null} `null` if valid, otherwise the reason why it is not
         */
        LiftingResponse.verify = function verify(message) {
            if (typeof message !== "object" || message === null)
                return "object expected";
            if (message.isDown != null && message.hasOwnProperty("isDown"))
                if (typeof message.isDown !== "boolean")
                    return "isDown: boolean expected";
            return null;
        };

        /**
         * Creates a LiftingResponse message from a plain object. Also converts values to their respective internal types.
         * @function fromObject
         * @memberof lifting.LiftingResponse
         * @static
         * @param {Object.<string,*>} object Plain object
         * @returns {lifting.LiftingResponse} LiftingResponse
         */
        LiftingResponse.fromObject = function fromObject(object) {
            if (object instanceof $root.lifting.LiftingResponse)
                return object;
            let message = new $root.lifting.LiftingResponse();
            if (object.isDown != null)
                message.isDown = Boolean(object.isDown);
            return message;
        };

        /**
         * Creates a plain object from a LiftingResponse message. Also converts values to other types if specified.
         * @function toObject
         * @memberof lifting.LiftingResponse
         * @static
         * @param {lifting.LiftingResponse} message LiftingResponse
         * @param {$protobuf.IConversionOptions} [options] Conversion options
         * @returns {Object.<string,*>} Plain object
         */
        LiftingResponse.toObject = function toObject(message, options) {
            if (!options)
                options = {};
            let object = {};
            if (options.defaults)
                object.isDown = false;
            if (message.isDown != null && message.hasOwnProperty("isDown"))
                object.isDown = message.isDown;
            return object;
        };

        /**
         * Converts this LiftingResponse to JSON.
         * @function toJSON
         * @memberof lifting.LiftingResponse
         * @instance
         * @returns {Object.<string,*>} JSON object
         */
        LiftingResponse.prototype.toJSON = function toJSON() {
            return this.constructor.toObject(this, $protobuf.util.toJSONOptions);
        };

        /**
         * Gets the default type url for LiftingResponse
         * @function getTypeUrl
         * @memberof lifting.LiftingResponse
         * @static
         * @param {string} [typeUrlPrefix] your custom typeUrlPrefix(default "type.googleapis.com")
         * @returns {string} The default type url
         */
        LiftingResponse.getTypeUrl = function getTypeUrl(typeUrlPrefix) {
            if (typeUrlPrefix === undefined) {
                typeUrlPrefix = "type.googleapis.com";
            }
            return typeUrlPrefix + "/lifting.LiftingResponse";
        };

        return LiftingResponse;
    })();

    return lifting;
})();

export { $root as default };
