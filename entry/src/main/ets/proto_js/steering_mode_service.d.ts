// import * as $protobuf from "protobufjs";
import * as $protobuf from "@ohos/protobufjs";
import Long = require("long");
/** Namespace steering_mode. */
export namespace steering_mode {

    /** Properties of a SteeringModeResponse. */
    interface ISteeringModeResponse {

        /** SteeringModeResponse steeringMode */
        steeringMode?: (string | null);

        /** SteeringModeResponse steeringModeId */
        steeringModeId?: (number | Long | null);
    }

    /** Represents a SteeringModeResponse. */
    class SteeringModeResponse implements ISteeringModeResponse {

        /**
         * Constructs a new SteeringModeResponse.
         * @param [properties] Properties to set
         */
        constructor(properties?: steering_mode.ISteeringModeResponse);

        /** SteeringModeResponse steeringMode. */
        public steeringMode: string;

        /** SteeringModeResponse steeringModeId. */
        public steeringModeId: (number | Long);

        /**
         * Creates a new SteeringModeResponse instance using the specified properties.
         * @param [properties] Properties to set
         * @returns SteeringModeResponse instance
         */
        public static create(properties?: steering_mode.ISteeringModeResponse): steering_mode.SteeringModeResponse;

        /**
         * Encodes the specified SteeringModeResponse message. Does not implicitly {@link steering_mode.SteeringModeResponse.verify|verify} messages.
         * @param message SteeringModeResponse message or plain object to encode
         * @param [writer] Writer to encode to
         * @returns Writer
         */
        public static encode(message: steering_mode.ISteeringModeResponse, writer?: $protobuf.Writer): $protobuf.Writer;

        /**
         * Encodes the specified SteeringModeResponse message, length delimited. Does not implicitly {@link steering_mode.SteeringModeResponse.verify|verify} messages.
         * @param message SteeringModeResponse message or plain object to encode
         * @param [writer] Writer to encode to
         * @returns Writer
         */
        public static encodeDelimited(message: steering_mode.ISteeringModeResponse, writer?: $protobuf.Writer): $protobuf.Writer;

        /**
         * Decodes a SteeringModeResponse message from the specified reader or buffer.
         * @param reader Reader or buffer to decode from
         * @param [length] Message length if known beforehand
         * @returns SteeringModeResponse
         * @throws {Error} If the payload is not a reader or valid buffer
         * @throws {$protobuf.util.ProtocolError} If required fields are missing
         */
        public static decode(reader: ($protobuf.Reader | Uint8Array), length?: number): steering_mode.SteeringModeResponse;

        /**
         * Decodes a SteeringModeResponse message from the specified reader or buffer, length delimited.
         * @param reader Reader or buffer to decode from
         * @returns SteeringModeResponse
         * @throws {Error} If the payload is not a reader or valid buffer
         * @throws {$protobuf.util.ProtocolError} If required fields are missing
         */
        public static decodeDelimited(reader: ($protobuf.Reader | Uint8Array)): steering_mode.SteeringModeResponse;

        /**
         * Verifies a SteeringModeResponse message.
         * @param message Plain object to verify
         * @returns `null` if valid, otherwise the reason why it is not
         */
        public static verify(message: { [k: string]: any }): (string | null);

        /**
         * Creates a SteeringModeResponse message from a plain object. Also converts values to their respective internal types.
         * @param object Plain object
         * @returns SteeringModeResponse
         */
        public static fromObject(object: { [k: string]: any }): steering_mode.SteeringModeResponse;

        /**
         * Creates a plain object from a SteeringModeResponse message. Also converts values to other types if specified.
         * @param message SteeringModeResponse
         * @param [options] Conversion options
         * @returns Plain object
         */
        public static toObject(message: steering_mode.SteeringModeResponse, options?: $protobuf.IConversionOptions): { [k: string]: any };

        /**
         * Converts this SteeringModeResponse to JSON.
         * @returns JSON object
         */
        public toJSON(): { [k: string]: any };

        /**
         * Gets the default type url for SteeringModeResponse
         * @param [typeUrlPrefix] your custom typeUrlPrefix(default "type.googleapis.com")
         * @returns The default type url
         */
        public static getTypeUrl(typeUrlPrefix?: string): string;
    }
}
