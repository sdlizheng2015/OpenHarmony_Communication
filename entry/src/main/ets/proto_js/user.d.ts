// import * as $protobuf from "protobufjs";
import * as $protobuf from "@ohos/protobufjs";
import Long = require("long");
/** Namespace user. */
export namespace user {

    /** Properties of a UserLoginResponse. */
    interface IUserLoginResponse {

        /** UserLoginResponse sessionId */
        sessionId?: (string|null);

        /** UserLoginResponse userPrivilege */
        userPrivilege?: (string|null);

        /** UserLoginResponse isTokenType */
        isTokenType?: (boolean|null);

        /** UserLoginResponse formatTimestamp */
        formatTimestamp?: (number|Long|null);

        /** UserLoginResponse data */
        data?: (Uint8Array|null);
    }

    /** Represents a UserLoginResponse. */
    class UserLoginResponse implements IUserLoginResponse {

        /**
         * Constructs a new UserLoginResponse.
         * @param [properties] Properties to set
         */
        constructor(properties?: user.IUserLoginResponse);

        /** UserLoginResponse sessionId. */
        public sessionId: string;

        /** UserLoginResponse userPrivilege. */
        public userPrivilege: string;

        /** UserLoginResponse isTokenType. */
        public isTokenType: boolean;

        /** UserLoginResponse formatTimestamp. */
        public formatTimestamp: (number|Long);

        /** UserLoginResponse data. */
        public data: Uint8Array;

        /**
         * Creates a new UserLoginResponse instance using the specified properties.
         * @param [properties] Properties to set
         * @returns UserLoginResponse instance
         */
        public static create(properties?: user.IUserLoginResponse): user.UserLoginResponse;

        /**
         * Encodes the specified UserLoginResponse message. Does not implicitly {@link user.UserLoginResponse.verify|verify} messages.
         * @param message UserLoginResponse message or plain object to encode
         * @param [writer] Writer to encode to
         * @returns Writer
         */
        public static encode(message: user.IUserLoginResponse, writer?: $protobuf.Writer): $protobuf.Writer;

        /**
         * Encodes the specified UserLoginResponse message, length delimited. Does not implicitly {@link user.UserLoginResponse.verify|verify} messages.
         * @param message UserLoginResponse message or plain object to encode
         * @param [writer] Writer to encode to
         * @returns Writer
         */
        public static encodeDelimited(message: user.IUserLoginResponse, writer?: $protobuf.Writer): $protobuf.Writer;

        /**
         * Decodes a UserLoginResponse message from the specified reader or buffer.
         * @param reader Reader or buffer to decode from
         * @param [length] Message length if known beforehand
         * @returns UserLoginResponse
         * @throws {Error} If the payload is not a reader or valid buffer
         * @throws {$protobuf.util.ProtocolError} If required fields are missing
         */
        public static decode(reader: ($protobuf.Reader|Uint8Array), length?: number): user.UserLoginResponse;

        /**
         * Decodes a UserLoginResponse message from the specified reader or buffer, length delimited.
         * @param reader Reader or buffer to decode from
         * @returns UserLoginResponse
         * @throws {Error} If the payload is not a reader or valid buffer
         * @throws {$protobuf.util.ProtocolError} If required fields are missing
         */
        public static decodeDelimited(reader: ($protobuf.Reader|Uint8Array)): user.UserLoginResponse;

        /**
         * Verifies a UserLoginResponse message.
         * @param message Plain object to verify
         * @returns `null` if valid, otherwise the reason why it is not
         */
        public static verify(message: { [k: string]: any }): (string|null);

        /**
         * Creates a UserLoginResponse message from a plain object. Also converts values to their respective internal types.
         * @param object Plain object
         * @returns UserLoginResponse
         */
        public static fromObject(object: { [k: string]: any }): user.UserLoginResponse;

        /**
         * Creates a plain object from a UserLoginResponse message. Also converts values to other types if specified.
         * @param message UserLoginResponse
         * @param [options] Conversion options
         * @returns Plain object
         */
        public static toObject(message: user.UserLoginResponse, options?: $protobuf.IConversionOptions): { [k: string]: any };

        /**
         * Converts this UserLoginResponse to JSON.
         * @returns JSON object
         */
        public toJSON(): { [k: string]: any };

        /**
         * Gets the default type url for UserLoginResponse
         * @param [typeUrlPrefix] your custom typeUrlPrefix(default "type.googleapis.com")
         * @returns The default type url
         */
        public static getTypeUrl(typeUrlPrefix?: string): string;
    }
}
