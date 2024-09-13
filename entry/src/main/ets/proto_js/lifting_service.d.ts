// import * as $protobuf from "protobufjs";
import * as $protobuf from "@ohos/protobufjs";
import Long = require("long");
/** Namespace lifting. */
export namespace lifting {

    /** Properties of a LiftingResponse. */
    interface ILiftingResponse {

        /** LiftingResponse isDown */
        isDown?: (boolean | null);
    }

    /** Represents a LiftingResponse. */
    class LiftingResponse implements ILiftingResponse {

        /**
         * Constructs a new LiftingResponse.
         * @param [properties] Properties to set
         */
        constructor(properties?: lifting.ILiftingResponse);

        /** LiftingResponse isDown. */
        public isDown: boolean;

        /**
         * Creates a new LiftingResponse instance using the specified properties.
         * @param [properties] Properties to set
         * @returns LiftingResponse instance
         */
        public static create(properties?: lifting.ILiftingResponse): lifting.LiftingResponse;

        /**
         * Encodes the specified LiftingResponse message. Does not implicitly {@link lifting.LiftingResponse.verify|verify} messages.
         * @param message LiftingResponse message or plain object to encode
         * @param [writer] Writer to encode to
         * @returns Writer
         */
        public static encode(message: lifting.ILiftingResponse, writer?: $protobuf.Writer): $protobuf.Writer;

        /**
         * Encodes the specified LiftingResponse message, length delimited. Does not implicitly {@link lifting.LiftingResponse.verify|verify} messages.
         * @param message LiftingResponse message or plain object to encode
         * @param [writer] Writer to encode to
         * @returns Writer
         */
        public static encodeDelimited(message: lifting.ILiftingResponse, writer?: $protobuf.Writer): $protobuf.Writer;

        /**
         * Decodes a LiftingResponse message from the specified reader or buffer.
         * @param reader Reader or buffer to decode from
         * @param [length] Message length if known beforehand
         * @returns LiftingResponse
         * @throws {Error} If the payload is not a reader or valid buffer
         * @throws {$protobuf.util.ProtocolError} If required fields are missing
         */
        public static decode(reader: ($protobuf.Reader | Uint8Array), length?: number): lifting.LiftingResponse;

        /**
         * Decodes a LiftingResponse message from the specified reader or buffer, length delimited.
         * @param reader Reader or buffer to decode from
         * @returns LiftingResponse
         * @throws {Error} If the payload is not a reader or valid buffer
         * @throws {$protobuf.util.ProtocolError} If required fields are missing
         */
        public static decodeDelimited(reader: ($protobuf.Reader | Uint8Array)): lifting.LiftingResponse;

        /**
         * Verifies a LiftingResponse message.
         * @param message Plain object to verify
         * @returns `null` if valid, otherwise the reason why it is not
         */
        public static verify(message: { [k: string]: any }): (string | null);

        /**
         * Creates a LiftingResponse message from a plain object. Also converts values to their respective internal types.
         * @param object Plain object
         * @returns LiftingResponse
         */
        public static fromObject(object: { [k: string]: any }): lifting.LiftingResponse;

        /**
         * Creates a plain object from a LiftingResponse message. Also converts values to other types if specified.
         * @param message LiftingResponse
         * @param [options] Conversion options
         * @returns Plain object
         */
        public static toObject(message: lifting.LiftingResponse, options?: $protobuf.IConversionOptions): { [k: string]: any };

        /**
         * Converts this LiftingResponse to JSON.
         * @returns JSON object
         */
        public toJSON(): { [k: string]: any };

        /**
         * Gets the default type url for LiftingResponse
         * @param [typeUrlPrefix] your custom typeUrlPrefix(default "type.googleapis.com")
         * @returns The default type url
         */
        public static getTypeUrl(typeUrlPrefix?: string): string;
    }
}
