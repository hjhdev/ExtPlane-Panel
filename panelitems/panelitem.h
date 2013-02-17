#ifndef PANELITEM_H
#define PANELITEM_H

#include <QGraphicsItem>
#include <QSettings>

// Not directly used by PanelItem, but included here to reduce
// code amount in all subclasses
#include <QPainter>
#include <QGridLayout>
#include "units.h"
#include "../valueinterpolator.h"
#include "../extplaneconnection.h"
#include "../extplaneclient.h"
#include "panelitemfactory.h"


#ifdef MOBILE_DEVICE
#define SCALE_HANDLE_SIZE 50
#else
#define SCALE_HANDLE_SIZE 20
#endif
#define SNAP_GRID_SIZE 10

class PanelItem : public QObject, public QGraphicsItem {
    Q_OBJECT
    Q_INTERFACES(QGraphicsItem)
public:
    explicit PanelItem(QObject *parent);
    ~PanelItem();
    virtual QRectF boundingRect() const;
    virtual void paint(QPainter *painter, const QStyleOptionGraphicsItem *option, QWidget *widget);
    float width() const;
    float height() const;
    void setSize(float w, float h);
    /**
     * This is called whenever the panel item has changed size (including when first added to the scene).
     * Panel items which cache resources be pre-rendering complicated stuff should use this method for doing so.
     */
    virtual void updateForNewSize(float w, float h) {};
    void setEditMode(bool em);
    bool isEditMode();
    /**
     * Automatically implemented by panel items when using the REGISTER_WITH_PANEL_ITEM_FACTORY macro.
     * This method defines the display name for the type of gauge and is used by the panel item factory.
     */
    virtual QString typeName() = 0;
    virtual void storeSettings(QSettings &settings);
    virtual void loadSettings(QSettings &settings);
    int itemRotation();
    virtual void createSettings(QGridLayout *layout);
    virtual void applySettings();
protected:
    virtual void mousePressEvent ( QGraphicsSceneMouseEvent * event );
    virtual void mouseMoveEvent(QGraphicsSceneMouseEvent *event);
    virtual void mouseReleaseEvent(QGraphicsSceneMouseEvent *event);
    virtual void mouseDoubleClickEvent ( QGraphicsSceneMouseEvent *event);
    QVariant itemChange(GraphicsItemChange change, const QVariant &value);
    QFont defaultFont;

    // Use for mechanical instrument
    QColor darkGrayColor;
signals:
    void panelItemSelected(PanelItem *g, bool sel=true);
    void editPanelItem(PanelItem *item);
    /**
     * @TODO: dankrusi: For warning when closing a dirty file without saving, this needs to be called by
     * the panel items when settings are changed. I haven't found a nice way to do this automatically without
     * going in and touching all the panel items...
     */
    void panelItemChanged(PanelItem *item);
public slots:
    void setPanelRotation(int angle);
    void setItemRotation(int angle);
    void setZValue(int z);
    virtual void tickTime(double dt, int total);
private:
    float _width, _height;
    bool resizing, _editMode;
    int _panelRotation, _itemRotation;
};

#endif // PANELITEM_H