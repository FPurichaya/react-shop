import React from "react";
import { Button, Header, Image, Modal } from "semantic-ui-react";
import ModalPhoto from "../media/img/modal.png";

const ModalPage = ({ open, onClose }) => (
  <div>
    <Modal open={open} onClose={onClose}>
      <Modal.Header>
        <span>Welcome!</span>
        <Button
          icon="times"
          floated="right"
          size="mini"
          onClick={() => onClose()}
        />
      </Modal.Header>

      <Modal.Content image>
        <Image wrapped size="medium" src={ModalPhoto} />
        <Modal.Description>
          <Header>Thank you for coming to my app</Header>
          <p>Please read first about the features implemented.</p>
          <p>Later try to find some good vibes for yourself :)</p>
          <p>
            I will answer all your question about my skills with pleasure so
            don't forget to contact me after that :)
          </p>
          <p floated="right">Paweł</p>
          <Button positive floated="right" onClick={() => onClose()}>
            Explore
          </Button>
        </Modal.Description>
      </Modal.Content>
    </Modal>
  </div>
);

export default ModalPage;
