/*
 * Copyright 2018 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */



// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: aart_message.proto

#ifndef PROTOBUF_aart_5fmessage_2eproto__INCLUDED
#define PROTOBUF_aart_5fmessage_2eproto__INCLUDED

#include <string>

#include <google/protobuf/stubs/common.h>

#if GOOGLE_PROTOBUF_VERSION < 2005000
#error This file was generated by a newer version of protoc which is
#error incompatible with your Protocol Buffer headers.  Please update
#error your headers.
#endif
#if 2005000 < GOOGLE_PROTOBUF_MIN_PROTOC_VERSION
#error This file was generated by an older version of protoc which is
#error incompatible with your Protocol Buffer headers.  Please
#error regenerate this file with a newer version of protoc.
#endif

#include <google/protobuf/generated_message_util.h>
#include <google/protobuf/message.h>
#include <google/protobuf/repeated_field.h>
#include <google/protobuf/extension_set.h>
#include <google/protobuf/generated_enum_reflection.h>
#include <google/protobuf/unknown_field_set.h>
// @@protoc_insertion_point(includes)

// Internal implementation detail -- do not call these.
void  protobuf_AddDesc_aart_5fmessage_2eproto();
void protobuf_AssignDesc_aart_5fmessage_2eproto();
void protobuf_ShutdownFile_aart_5fmessage_2eproto();

class AartMessage;

enum AartMessage_AartMessageType {
  AartMessage_AartMessageType_R_HELLO = 0,
  AartMessage_AartMessageType_R_CAPABILITIES = 1,
  AartMessage_AartMessageType_R_OPERATION = 2,
  AartMessage_AartMessageType_R_OPERATION_RESPONSE = 3
};
bool AartMessage_AartMessageType_IsValid(int value);
const AartMessage_AartMessageType AartMessage_AartMessageType_AartMessageType_MIN = AartMessage_AartMessageType_R_HELLO;
const AartMessage_AartMessageType AartMessage_AartMessageType_AartMessageType_MAX = AartMessage_AartMessageType_R_OPERATION_RESPONSE;
const int AartMessage_AartMessageType_AartMessageType_ARRAYSIZE = AartMessage_AartMessageType_AartMessageType_MAX + 1;

const ::google::protobuf::EnumDescriptor* AartMessage_AartMessageType_descriptor();
inline const ::std::string& AartMessage_AartMessageType_Name(AartMessage_AartMessageType value) {
  return ::google::protobuf::internal::NameOfEnum(
    AartMessage_AartMessageType_descriptor(), value);
}
inline bool AartMessage_AartMessageType_Parse(
    const ::std::string& name, AartMessage_AartMessageType* value) {
  return ::google::protobuf::internal::ParseNamedEnum<AartMessage_AartMessageType>(
    AartMessage_AartMessageType_descriptor(), name, value);
}
// ===================================================================

class AartMessage : public ::google::protobuf::Message {
 public:
  AartMessage();
  virtual ~AartMessage();

  AartMessage(const AartMessage& from);

  inline AartMessage& operator=(const AartMessage& from) {
    //CopyFrom(from);
    return *this;
  }

  inline const ::google::protobuf::UnknownFieldSet& unknown_fields() const {
    return _unknown_fields_;
  }

  inline ::google::protobuf::UnknownFieldSet* mutable_unknown_fields() {
    return &_unknown_fields_;
  }

  static const ::google::protobuf::Descriptor* descriptor();
  static const AartMessage& default_instance();

  void Swap(AartMessage* other);

  // implements Message ----------------------------------------------

  AartMessage* New() const;
  //void CopyFrom(const ::google::protobuf::Message& from);
  //void MergeFrom(const ::google::protobuf::Message& from);
  //void CopyFrom(const AartMessage& from);
  //void MergeFrom(const AartMessage& from);
  void Clear();
  bool IsInitialized() const;

  int ByteSize() const;
  bool MergePartialFromCodedStream(
      ::google::protobuf::io::CodedInputStream* input);
  void SerializeWithCachedSizes(
      ::google::protobuf::io::CodedOutputStream* output) const;
  ::google::protobuf::uint8* SerializeWithCachedSizesToArray(::google::protobuf::uint8* output) const;
  int GetCachedSize() const { return _cached_size_; }
  private:
  void SharedCtor();
  void SharedDtor();
  void SetCachedSize(int size) const;
  public:

  ::google::protobuf::Metadata GetMetadata() const;

  // nested types ----------------------------------------------------

  typedef AartMessage_AartMessageType AartMessageType;
  static const AartMessageType R_HELLO = AartMessage_AartMessageType_R_HELLO;
  static const AartMessageType R_CAPABILITIES = AartMessage_AartMessageType_R_CAPABILITIES;
  static const AartMessageType R_OPERATION = AartMessage_AartMessageType_R_OPERATION;
  static const AartMessageType R_OPERATION_RESPONSE = AartMessage_AartMessageType_R_OPERATION_RESPONSE;
  static inline bool AartMessageType_IsValid(int value) {
    return AartMessage_AartMessageType_IsValid(value);
  }
  static const AartMessageType AartMessageType_MIN =
    AartMessage_AartMessageType_AartMessageType_MIN;
  static const AartMessageType AartMessageType_MAX =
    AartMessage_AartMessageType_AartMessageType_MAX;
  static const int AartMessageType_ARRAYSIZE =
    AartMessage_AartMessageType_AartMessageType_ARRAYSIZE;
  static inline const ::google::protobuf::EnumDescriptor*
  AartMessageType_descriptor() {
    return AartMessage_AartMessageType_descriptor();
  }
  static inline const ::std::string& AartMessageType_Name(AartMessageType value) {
    return AartMessage_AartMessageType_Name(value);
  }
  static inline bool AartMessageType_Parse(const ::std::string& name,
      AartMessageType* value) {
    return AartMessage_AartMessageType_Parse(name, value);
  }

  // accessors -------------------------------------------------------

  // required .AartMessage.AartMessageType type = 1;
  inline bool has_type() const;
  inline void clear_type();
  static const int kTypeFieldNumber = 1;
  inline ::AartMessage_AartMessageType type() const;
  inline void set_type(::AartMessage_AartMessageType value);

  // required string client_id = 2;
  inline bool has_client_id() const;
  inline void clear_client_id();
  static const int kClientIdFieldNumber = 2;
  inline const ::std::string& client_id() const;
  inline void set_client_id(const ::std::string& value);
  inline void set_client_id(const char* value);
  inline void set_client_id(const char* value, size_t size);
  inline ::std::string* mutable_client_id();
  inline ::std::string* release_client_id();
  inline void set_allocated_client_id(::std::string* client_id);

  // required string content = 3;
  inline bool has_content() const;
  inline void clear_content();
  static const int kContentFieldNumber = 3;
  inline const ::std::string& content() const;
  inline void set_content(const ::std::string& value);
  inline void set_content(const char* value);
  inline void set_content(const char* value, size_t size);
  inline ::std::string* mutable_content();
  inline ::std::string* release_content();
  inline void set_allocated_content(::std::string* content);

  // @@protoc_insertion_point(class_scope:AartMessage)
 private:
  inline void set_has_type();
  inline void clear_has_type();
  inline void set_has_client_id();
  inline void clear_has_client_id();
  inline void set_has_content();
  inline void clear_has_content();

  ::google::protobuf::UnknownFieldSet _unknown_fields_;

  ::std::string* client_id_;
  ::std::string* content_;
  int type_;

  mutable int _cached_size_;
  ::google::protobuf::uint32 _has_bits_[(3 + 31) / 32];

  friend void  protobuf_AddDesc_aart_5fmessage_2eproto();
  friend void protobuf_AssignDesc_aart_5fmessage_2eproto();
  friend void protobuf_ShutdownFile_aart_5fmessage_2eproto();

  void InitAsDefaultInstance();
  static AartMessage* default_instance_;
};
// ===================================================================


// ===================================================================

// AartMessage

// required .AartMessage.AartMessageType type = 1;
inline bool AartMessage::has_type() const {
  return (_has_bits_[0] & 0x00000001u) != 0;
}
inline void AartMessage::set_has_type() {
  _has_bits_[0] |= 0x00000001u;
}
inline void AartMessage::clear_has_type() {
  _has_bits_[0] &= ~0x00000001u;
}
inline void AartMessage::clear_type() {
  type_ = 0;
  clear_has_type();
}
inline ::AartMessage_AartMessageType AartMessage::type() const {
  return static_cast< ::AartMessage_AartMessageType >(type_);
}
inline void AartMessage::set_type(::AartMessage_AartMessageType value) {
  assert(::AartMessage_AartMessageType_IsValid(value));
  set_has_type();
  type_ = value;
}

// required string client_id = 2;
inline bool AartMessage::has_client_id() const {
  return (_has_bits_[0] & 0x00000002u) != 0;
}
inline void AartMessage::set_has_client_id() {
  _has_bits_[0] |= 0x00000002u;
}
inline void AartMessage::clear_has_client_id() {
  _has_bits_[0] &= ~0x00000002u;
}
inline void AartMessage::clear_client_id() {
  if (client_id_ != &::google::protobuf::internal::kEmptyString) {
    client_id_->clear();
  }
  clear_has_client_id();
}
inline const ::std::string& AartMessage::client_id() const {
  return *client_id_;
}
inline void AartMessage::set_client_id(const ::std::string& value) {
  set_has_client_id();
  if (client_id_ == &::google::protobuf::internal::kEmptyString) {
    client_id_ = new ::std::string;
  }
  client_id_->assign(value);
}
inline void AartMessage::set_client_id(const char* value) {
  set_has_client_id();
  if (client_id_ == &::google::protobuf::internal::kEmptyString) {
    client_id_ = new ::std::string;
  }
  client_id_->assign(value);
}
inline void AartMessage::set_client_id(const char* value, size_t size) {
  set_has_client_id();
  if (client_id_ == &::google::protobuf::internal::kEmptyString) {
    client_id_ = new ::std::string;
  }
  client_id_->assign(reinterpret_cast<const char*>(value), size);
}
inline ::std::string* AartMessage::mutable_client_id() {
  set_has_client_id();
  if (client_id_ == &::google::protobuf::internal::kEmptyString) {
    client_id_ = new ::std::string;
  }
  return client_id_;
}
inline ::std::string* AartMessage::release_client_id() {
  clear_has_client_id();
  if (client_id_ == &::google::protobuf::internal::kEmptyString) {
    return NULL;
  } else {
    ::std::string* temp = client_id_;
    client_id_ = const_cast< ::std::string*>(&::google::protobuf::internal::kEmptyString);
    return temp;
  }
}
inline void AartMessage::set_allocated_client_id(::std::string* client_id) {
  if (client_id_ != &::google::protobuf::internal::kEmptyString) {
    delete client_id_;
  }
  if (client_id) {
    set_has_client_id();
    client_id_ = client_id;
  } else {
    clear_has_client_id();
    client_id_ = const_cast< ::std::string*>(&::google::protobuf::internal::kEmptyString);
  }
}

// required string content = 3;
inline bool AartMessage::has_content() const {
  return (_has_bits_[0] & 0x00000004u) != 0;
}
inline void AartMessage::set_has_content() {
  _has_bits_[0] |= 0x00000004u;
}
inline void AartMessage::clear_has_content() {
  _has_bits_[0] &= ~0x00000004u;
}
inline void AartMessage::clear_content() {
  if (content_ != &::google::protobuf::internal::kEmptyString) {
    content_->clear();
  }
  clear_has_content();
}
inline const ::std::string& AartMessage::content() const {
  return *content_;
}
inline void AartMessage::set_content(const ::std::string& value) {
  set_has_content();
  if (content_ == &::google::protobuf::internal::kEmptyString) {
    content_ = new ::std::string;
  }
  content_->assign(value);
}
inline void AartMessage::set_content(const char* value) {
  set_has_content();
  if (content_ == &::google::protobuf::internal::kEmptyString) {
    content_ = new ::std::string;
  }
  content_->assign(value);
}
inline void AartMessage::set_content(const char* value, size_t size) {
  set_has_content();
  if (content_ == &::google::protobuf::internal::kEmptyString) {
    content_ = new ::std::string;
  }
  content_->assign(reinterpret_cast<const char*>(value), size);
}
inline ::std::string* AartMessage::mutable_content() {
  set_has_content();
  if (content_ == &::google::protobuf::internal::kEmptyString) {
    content_ = new ::std::string;
  }
  return content_;
}
inline ::std::string* AartMessage::release_content() {
  clear_has_content();
  if (content_ == &::google::protobuf::internal::kEmptyString) {
    return NULL;
  } else {
    ::std::string* temp = content_;
    content_ = const_cast< ::std::string*>(&::google::protobuf::internal::kEmptyString);
    return temp;
  }
}
inline void AartMessage::set_allocated_content(::std::string* content) {
  if (content_ != &::google::protobuf::internal::kEmptyString) {
    delete content_;
  }
  if (content) {
    set_has_content();
    content_ = content;
  } else {
    clear_has_content();
    content_ = const_cast< ::std::string*>(&::google::protobuf::internal::kEmptyString);
  }
}


// @@protoc_insertion_point(namespace_scope)

#ifndef SWIG
namespace google {
namespace protobuf {

template <>
inline const EnumDescriptor* GetEnumDescriptor< ::AartMessage_AartMessageType>() {
  return ::AartMessage_AartMessageType_descriptor();
}

}  // namespace google
}  // namespace protobuf
#endif  // SWIG

// @@protoc_insertion_point(global_scope)

#endif  // PROTOBUF_aart_5fmessage_2eproto__INCLUDED
